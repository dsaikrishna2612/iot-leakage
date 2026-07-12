# Steps to Run the Project

## Prerequisites

| Software | Purpose | Notes |
|----------|---------|-------|
| JDK 8+ (or JDK 21) | Run Java / Tomcat | Required |
| Apache Tomcat 9 | Host the JSP web app | HTTP port **8081** |
| MySQL 8 | Store users, documents, attacks | Service `MySQL80` running |
| Browser | Open the application | Chrome / Edge |

---

## Step 1: Configure MySQL password

The file `leakage/connect.jsp` connects with:

- Database: `leakage_of_authorization`
- Username: `root`
- Password: `root`

In MySQL Workbench or command line, set root password to `root` (or change `connect.jsp` to your actual password):

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
```

---

## Step 2: Create and import the database

1. Open MySQL Workbench (or MySQL command line).
2. Open the script: `leakage/Database/Database.txt`
3. Run the full script.

This creates:

- Database: `leakage_of_authorization`
- Tables: `user`, `server`, `documents`, `metadata`, `backup`, `attacker`, `crossattack`, `reviews`, `search`, `search_found`
- Sample data (users, server login, sample documents)

**Quick check:**

```sql
USE leakage_of_authorization;
SHOW TABLES;
SELECT * FROM server;
SELECT username, status FROM user;
```

---

## Step 3: Deploy the project to Tomcat

1. Copy the entire `leakage` folder into Tomcat’s webapps directory:

```text
C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\leakage
```

2. Confirm `WEB-INF\lib` contains jars such as:
   - `mysql-connector-java-5.1.5-bin.jar`
   - `cos.jar` (file upload)
   - `bcprov-jdk15-138.jar` / BouncyCastle (Base64 / crypto helpers)

---

## Step 4: Start Tomcat

**Option A — Windows Service (as Administrator):**

```powershell
Start-Service Tomcat9
```

**Option B — Command line:**

```powershell
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot"
$env:CATALINA_HOME = "C:\Program Files\Apache Software Foundation\Tomcat 9.0"
& "$env:CATALINA_HOME\bin\catalina.bat" start
```

Tomcat in this setup listens on **port 8081**.

---

## Step 5: Open the application

Home page:

```text
http://localhost:8081/leakage/index.html
```

Other useful URLs:

| Page | URL |
|------|-----|
| User Login | http://localhost:8081/leakage/UserLogin.jsp |
| Server Login | http://localhost:8081/leakage/ServerLogin.jsp |
| Attacker page | http://localhost:8081/leakage/attacker.jsp |

---

## Step 6: Default login credentials

| Role | Username | Password |
|------|----------|----------|
| IoT Cloud Server | `IOTCloud` | `IOTCloud` |
| Authorized User | `Akash` | `Akash` |
| Authorized User | `Manjunath` | `Manjunath` |
| Authorized User | `tmksmanju` | `tmksmanju` |

---

## Step 7: Demo flow

1. **Server login** → add a document (category, title, file, image).
2. On upload, system stores Base64 content, SHA-1 signature, status `Safe`, and backup/metadata.
3. **User login** → search / view shared documents / add reviews.
4. Open **Attacker** page → search document → perform leakage / content attack.
5. Attack changes content + signature → status becomes `Not Safe`.
6. **Server dashboard** shows alert → click **Recover**.
7. Recovery restores original data from backup → status back to `Safe`.

---

## Stop Tomcat (when finished)

```powershell
& "C:\Program Files\Apache Software Foundation\Tomcat 9.0\bin\catalina.bat" stop
```
