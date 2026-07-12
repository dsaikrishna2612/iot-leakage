# Automation Guide — Docker Image Build & GitHub Actions Deploy

**Project:** Leakage of Authorization-Data in IoT Device Sharing  
**Stack:** JSP / Servlet · Apache Tomcat 9 · MySQL 8  
**Role focus:** Automation Engineer (CI/CD + containerization)

This document explains how to **containerize** the application with Docker and **automate build + deploy** using **GitHub Actions**. Use these steps in your viva to show DevOps / automation knowledge beyond the core application demo.

---

## Why this adds marks in viva

| Topic | What you can explain |
|-------|----------------------|
| Docker | Same app runs on any machine without installing Tomcat manually |
| Multi-container | App (Tomcat) + database (MySQL) as separate services |
| CI/CD | Push to GitHub → Actions builds image → pushes to registry → deploys |
| Secrets | Passwords / tokens never stored in code |
| Idempotent deploy | Same pipeline can re-run safely |

---

## Architecture (automation view)

```text
Developer push (main)
        │
        ▼
┌───────────────────┐
│  GitHub Actions   │
│  1. Checkout      │
│  2. Build image   │
│  3. Push to GHCR  │
│  4. Deploy (SSH)  │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐     ┌──────────────────┐
│ Tomcat container  │────▶│ MySQL container  │
│ (leakage webapp)  │     │ leakage_of_...   │
│ port 8080         │     │ port 3306        │
└───────────────────┘     └──────────────────┘
```

---

## Part A — Docker files (already added in this repo)

These files are ready to use:

| File | Purpose |
|------|---------|
| `Dockerfile` | Builds Tomcat image with `leakage` webapp |
| `.dockerignore` | Keeps build context small |
| `docker-compose.yml` | Local: Tomcat + MySQL together |
| `docker-compose.prod.yml` | Server: pull image from GHCR |
| `docker/mysql/01-init.sh` | Imports `Database.txt` on first DB start |
| `leakage/connect.jsp` | Reads `DB_HOST` (defaults to `localhost`) |
| `.github/workflows/deploy.yaml` | CI: build → push GHCR → optional SSH deploy |

### How JDBC works (Docker vs local Tomcat)

`connect.jsp` reads environment variables:

| Variable | Default | Docker Compose value |
|----------|---------|----------------------|
| `DB_HOST` | `localhost` | `db` |
| `DB_PORT` | `3306` | `3306` |
| `DB_NAME` | `leakage_of_authorization` | same |
| `DB_USER` / `DB_PASSWORD` | `root` / `root` | same |

**Viva tip:** Same code works for local Tomcat (`localhost`) and Docker (`DB_HOST=db`) — that is 12-factor style config.

---

## Part B — Build & run Docker locally (before CI)

### Step 5: Install Docker Desktop

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Confirm Docker is running:

```powershell
docker --version
docker compose version
```

---

### Step 6: Build the image manually

From the project root:

```powershell
cd C:\Users\Admin\Desktop\sai_mca_project\iot-leakage
docker build -t iot-leakage-app:latest .
```

| Flag / arg | Meaning |
|------------|---------|
| `-t iot-leakage-app:latest` | Tag (name:version) of the image |
| `.` | Build context = current directory |

Verify:

```powershell
docker images | Select-String "iot-leakage"
```

---

### Step 7: Run with Docker Compose

```powershell
docker compose up -d --build
```

Check containers:

```powershell
docker compose ps
docker compose logs -f app
```

Open the app:

```text
http://localhost:8080/leakage/index.html
```

Stop everything:

```powershell
docker compose down
```

---

### Step 8: (Optional) Push image to GitHub Container Registry (GHCR)

1. Create a GitHub Personal Access Token (classic) with scopes: `write:packages`, `read:packages`.
2. Log in and push:

```powershell
echo YOUR_GITHUB_TOKEN | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin
docker tag iot-leakage-app:latest ghcr.io/YOUR_GITHUB_USERNAME/iot-leakage-app:latest
docker push ghcr.io/YOUR_GITHUB_USERNAME/iot-leakage-app:latest
```

Replace `YOUR_GITHUB_USERNAME` with your GitHub username (lowercase).

---

## Part C — GitHub Actions CI/CD pipeline

### Step 9: Create the workflow file

Create (or fill) `.github/workflows/deploy.yaml`:

```yaml
name: Build and Deploy IoT Leakage App

on:
  push:
    branches: [ main ]
  workflow_dispatch:   # allows manual run from GitHub UI

env:
  IMAGE_NAME: iot-leakage-app

jobs:
  build-and-push:
    name: Build Docker image and push to GHCR
    runs-on: ubuntu-latest

    permissions:
      contents: read
      packages: write

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Log in to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Extract metadata (tags / labels)
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ghcr.io/${{ github.repository_owner }}/${{ env.IMAGE_NAME }}
          tags: |
            type=sha,prefix=
            type=raw,value=latest

      - name: Build and push Docker image
        uses: docker/build-push-action@v6
        with:
          context: .
          push: true
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
          cache-from: type=gha
          cache-to: type=gha,mode=max

  deploy:
    name: Deploy to server over SSH
    runs-on: ubuntu-latest
    needs: build-and-push
    if: github.ref == 'refs/heads/main'

    steps:
      - name: Deploy via SSH
        uses: appleboy/ssh-action@v1.2.0
        with:
          host: ${{ secrets.DEPLOY_HOST }}
          username: ${{ secrets.DEPLOY_USER }}
          key: ${{ secrets.DEPLOY_SSH_KEY }}
          script: |
            set -e
            echo "Pulling latest image..."
            echo "${{ secrets.GHCR_TOKEN }}" | docker login ghcr.io -u ${{ github.repository_owner }} --password-stdin
            docker pull ghcr.io/${{ github.repository_owner }}/iot-leakage-app:latest

            echo "Restarting app container..."
            cd /opt/iot-leakage || mkdir -p /opt/iot-leakage && cd /opt/iot-leakage
            docker compose pull || true
            docker compose up -d --remove-orphans

            echo "Deploy finished at $(date -u)"
```

**Pipeline flow to say in viva:**

1. Trigger on push to `main` (or manual `workflow_dispatch`)
2. Checkout source code
3. Login to GHCR with `GITHUB_TOKEN`
4. Build Docker image from `Dockerfile`
5. Push tagged image (`latest` + commit SHA)
6. SSH into deploy server and pull + restart containers

---

### Step 10: Add GitHub Secrets

In the GitHub repo: **Settings → Secrets and variables → Actions → New repository secret**

| Secret name | Purpose | Example |
|-------------|---------|---------|
| `DEPLOY_HOST` | Server IP / hostname | `203.0.113.10` |
| `DEPLOY_USER` | SSH username | `ubuntu` |
| `DEPLOY_SSH_KEY` | Private SSH key for deploy user | contents of `id_rsa` |
| `GHCR_TOKEN` | Token to pull private GHCR images on server | PAT with `read:packages` |

`GITHUB_TOKEN` is provided automatically by Actions — you do **not** create it for the build job.

---

### Step 11: Prepare the deploy server (one-time)

On the target VM / VPS:

```bash
# Install Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

# Create app directory and copy docker-compose.yml (and DB init if needed)
sudo mkdir -p /opt/iot-leakage
# copy docker-compose.yml here (image name must match GHCR image)

# Allow GitHub Actions SSH key in ~/.ssh/authorized_keys for DEPLOY_USER
```

On the server, `docker-compose.yml` can use the pre-built image instead of building locally:

```yaml
services:
  db:
    # same as local compose
    image: mysql:8.0
    # ...

  app:
    image: ghcr.io/YOUR_GITHUB_USERNAME/iot-leakage-app:latest
    ports:
      - "8080:8080"
    depends_on:
      db:
        condition: service_healthy
```

---

### Step 12: Enable Actions and run the pipeline

1. Commit and push:

```powershell
git add Dockerfile .dockerignore docker-compose.yml .github/workflows/deploy.yaml
git commit -m "Add Docker build and GitHub Actions deploy pipeline"
git push origin main
```

2. Open GitHub → **Actions** tab → watch **Build and Deploy IoT Leakage App**.
3. On success, verify:

```text
http://DEPLOY_HOST:8080/leakage/index.html
```

---

## Part D — Viva checklist (what to demonstrate)

### Demo script (3–5 minutes)

1. Show `Dockerfile` and explain base image + `COPY leakage/`.
2. Show `docker compose up --build` locally and open the app URL.
3. Show `.github/workflows/deploy.yaml` and walk through each step.
4. Open **Actions** run history (green check = successful CI/CD).
5. Mention secrets: passwords/keys not committed to Git.
6. Relate back to project: same leakage detection demo, now delivered via automated pipeline.

### Common viva questions & short answers

| Question | Short answer |
|----------|--------------|
| Why Docker? | Isolates Tomcat + dependencies; same image in local, CI, and server |
| What is a Docker image vs container? | Image = template; container = running instance of that image |
| Why GitHub Actions? | Free CI/CD integrated with Git; builds on every push |
| What is GHCR? | GitHub Container Registry — stores Docker images next to the repo |
| Why `depends_on` + healthcheck? | App starts only after MySQL is ready to accept connections |
| What are GitHub Secrets? | Encrypted env values injected at runtime; not visible in logs if used carefully |

---

## Part E — Folder layout after automation setup

```text
iot-leakage/
├── Dockerfile
├── .dockerignore
├── docker-compose.yml
├── .github/
│   └── workflows/
│       └── deploy.yaml
├── leakage/                 # JSP web application
├── automation.md            # this file
├── start.md
└── explanation.md
```

---

## Quick command reference

```powershell
# Local build
docker build -t iot-leakage-app:latest .

# Local run (app + DB)
docker compose up -d --build

# Logs
docker compose logs -f

# Stop
docker compose down

# Image list
docker images

# Running containers
docker ps
```

---

## Marks-oriented summary (one paragraph for viva)

> As the automation engineer for this project, I containerized the JSP application using a Tomcat base Docker image and orchestrated Tomcat with MySQL using Docker Compose. I created a GitHub Actions workflow that triggers on every push to `main`, builds the Docker image, pushes it to GitHub Container Registry, and deploys it to a server over SSH. Sensitive values such as SSH keys and registry tokens are stored as GitHub Secrets, so credentials never appear in source code. This gives us a repeatable CI/CD pipeline for the IoT authorization-leakage demonstration system.
