# Leakage of Authorization-Data in IoT Device Sharing — New Attacks and Countermeasure

## Project Overview (1-minute viva intro)

This project is a **web-based simulation** of authorization-data leakage problems that occur when IoT devices are shared between users on an IoT cloud.

In real IoT clouds, when one user shares a device with another user (delegatee), the cloud often exposes sensitive **authorization data** such as device IDs, product IDs, and access tokens. If this data leaks, an attacker can misuse shared access.

Our application demonstrates:

1. How shared content/authorization-related data can be **leaked or tampered**
2. How the system **detects** the attack using a **digital signature (SHA-1 hash)**
3. How the server **recovers** the original data from a **backup**

**Technology stack:** Java (JSP/Servlet), Apache Tomcat, MySQL, HTML/CSS/JavaScript, AES + Base64 encoding, SHA-1 digital signature.

---

## Steps to Run the Project

### Prerequisites

| Software | Purpose | Your machine notes |
|----------|---------|--------------------|
| JDK 8+ (or JDK 21) | Run Java / Tomcat | Already installed |
| Apache Tomcat 9 | Host the JSP web app | Installed; HTTP port **8081** |
| MySQL 8 | Store users, documents, attacks | Service `MySQL80` running |
| Browser | Open the application | Chrome / Edge |

### Step 1: Configure MySQL password to match the project

The file `leakage/connect.jsp` connects with:

- Database: `leakage_of_authorization`
- Username: `root`
- Password: `root`

In MySQL Workbench or command line, set root password to `root` (or change `connect.jsp` to your actual password):

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
```

### Step 2: Create and import the database

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

### Step 3: Deploy the project to Tomcat

1. Copy the entire `leakage` folder into Tomcat’s webapps directory:

```text
C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\leakage
```

2. Confirm `WEB-INF\lib` contains jars such as:
   - `mysql-connector-java-5.1.5-bin.jar`
   - `cos.jar` (file upload)
   - `bcprov-jdk15-138.jar` / BouncyCastle (Base64 / crypto helpers)

### Step 4: Start Tomcat

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

### Step 5: Open the application

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

### Step 6: Default login credentials (from seed data)

| Role | Username | Password |
|------|----------|----------|
| IoT Cloud Server | `IOTCloud` | `IOTCloud` |
| Authorized User | `Akash` | `Akash` |
| Authorized User | `Manjunath` | `Manjunath` |
| Authorized User | `tmksmanju` | `tmksmanju` |

### Step 7: Demo flow for viva / practical

1. **Server login** → add a document (category, title, file, image).
2. On upload, system stores:
   - Base64-encoded content
   - SHA-1 digital signature
   - Status = `Safe`
   - Copies into `backup` and `metadata`
3. **User login** → search / view shared documents / add reviews.
4. Open **Attacker** page → search document → perform leakage / content attack.
5. Attack changes content + signature → status becomes `Not Safe` → logged in `crossattack` / `attacker`.
6. **Server dashboard** shows alert → click **Recover**.
7. Recovery restores original content/signature from `backup`/`metadata` → status back to `Safe`.

### Stop Tomcat (when finished)

```powershell
& "C:\Program Files\Apache Software Foundation\Tomcat 9.0\bin\catalina.bat" stop
```

---

## Architecture (say this in viva)

```text
Browser (User / Server / Attacker)
        |
        |  HTTP
        v
 Apache Tomcat (JSP pages + business logic in JSP)
        |
        |  JDBC (connect.jsp)
        v
 MySQL Database (leakage_of_authorization)
```

### Modules

1. **Home module** — project introduction and navigation  
2. **User module** — register, login, profile, search docs, view shared docs, reviews  
3. **Server (IoT Cloud) module** — authorize users, upload docs, view attacks, recover data, charts/history  
4. **Attacker module** — simulate authorization/content leakage attacks  
5. **Security module** — Base64 encoding, SHA-1 digital signature, integrity check, backup recovery  

---

## Problem Statement (viva language)

In IoT device sharing, the owner delegates access to another user. IoT clouds manage this using authorization certificates (device ID, product ID, access token, etc.).

**Problems:**

- Authorization data management is inconsistent across clouds
- Sensitive authorization data may be exposed to the delegatee
- An attacker who obtains leaked authorization-related data can misuse shared resources
- Integrity of shared content can be broken without detection

**Goal of this project:**

- Simulate leakage / tampering attacks
- Detect integrity failure using digital signatures
- Recover original data using backup and metadata
- Show a practical countermeasure concept inspired by **SecHARE** (hide authorization data from the delegatee while still allowing sharing)

---

## Existing System vs Proposed System

### Existing System

- Device sharing relies on exposing authorization certificates to the delegatee
- Different IoT clouds use different ad-hoc delegation methods
- Leakage of tokens/IDs can lead to unauthorized access
- Limited automated integrity checking and recovery for shared authorization-related data

### Proposed System (this project)

- Shared document/content is treated as protected shared resource
- Content is encoded (Base64) and signed (SHA-1)
- Original signature is stored in `metadata` and `backup`
- Any unauthorized modification changes the hash → detected as **Not Safe**
- Server can recover original data from backup
- Admin must authorize users before they use shared services

---

## Database Design (explain briefly)

| Table | Purpose |
|-------|---------|
| `server` | IoT cloud admin login (`IOTCloud`) |
| `user` | Registered users + authorization status |
| `documents` | Shared documents (content, image, status, digital_sign) |
| `metadata` | Original digital signature reference |
| `backup` | Original content + signature for recovery |
| `attacker` | Records of attacker search/update attempts |
| `crossattack` | Leakage/cross-site style attack records + URL |
| `reviews` | User comments on documents |
| `search` / `search_found` | Search history |

Key idea: **documents** holds live data; **metadata/backup** hold the trusted original signature/content used for detection and recovery.

---

## Core Algorithms / Techniques

### 1. Encoding (confidentiality-lite / obfuscation)

Document content is Base64-encoded before storage so raw text is not stored in plain form.

### 2. Digital Signature / Integrity (SHA-1)

When a document is uploaded:

1. Content is processed
2. SHA-1 hash (digital signature) is generated
3. Signature is stored in `documents`, `metadata`, and `backup`
4. Status is set to `Safe`

### 3. Attack detection

When attacker modifies content:

1. Content is changed
2. New SHA-1 hash is computed
3. Live signature no longer matches metadata signature
4. Status becomes `Not Safe`
5. Attack details stored in `crossattack` / `attacker`

### 4. Recovery (countermeasure in this app)

Server clicks Recover:

1. Compare document signature with metadata
2. If mismatch, restore content + signature from `backup`
3. Set status back to `Safe`

---

## Module-wise Explanation (for detailed viva)

### A. User Module

**Pages:** `UserRegister.jsp`, `UserLogin.jsp`, `UserMain.jsp`, `SearchDocs.jsp`, `U_AllDocsByAdmin.jsp`, `U_Review.jsp`, etc.

**Functions:**

- Register with profile image
- Login only works fully after server sets status = `Authorized`
- Search shared documents by keyword
- View shared documents
- Post reviews

**Viva line:** “User represents the IoT end-user who accesses shared devices/documents after authorization.”

### B. Server / IoT Cloud Module

**Pages:** `ServerLogin.jsp`, `ServerMain.jsp`, `S_AddDoc.jsp`, `S_AllUsersandAuthorize.jsp`, `S_AttackedDocs.jsp`, `recovered.jsp`, etc.

**Functions:**

- Login as IoT Cloud
- Authorize / manage users
- Upload documents with image + content
- Generate signature and keep backup
- View attacker alerts
- Recover attacked documents
- View charts, search history, reviews, metadata

**Viva line:** “Server acts as the IoT cloud controller that manages sharing, monitors leakage attacks, and restores integrity.”

### C. Attacker Module

**Pages:** `attacker.jsp`, `attackersearch.jsp`, `attackerupdate.jsp`, `Leakageattack.jsp`

**Functions:**

- Search documents
- Tamper content (simulate leakage attack)
- Cause signature mismatch
- Leave attack trace with URL/time/user

**Viva line:** “Attacker module demonstrates how leaked authorization/access paths can be abused to modify shared data.”

---

## End-to-End Workflow (memorize this)

1. User registers → waits for authorization  
2. Server authorizes the user  
3. Server uploads shared document → encode + SHA-1 + backup  
4. Authorized user searches and views document  
5. Attacker exploits leakage path and tampers content  
6. Signature mismatch → document marked Not Safe  
7. Server sees alert and recovers from backup  
8. Document becomes Safe again  

---

## Mapping to Research Concept (SecHARE)

Paper idea: **SecHARE** hides authorization-data from the delegatee so sharing still works, but sensitive tokens/IDs are not exposed.

How this project maps that idea into a practical academic demo:

| Research concept | Project implementation |
|------------------|------------------------|
| Authorization-data leakage | Attacker can reach and modify shared content |
| Delegation / sharing | Server shares documents with authorized users |
| Countermeasure | Hide/protect integrity via signature + backup recovery |
| Monitoring | Attack logs in `attacker` / `crossattack` |
| Validation | Status Safe vs Not Safe after attack/recover |

In viva you can say:

> “The research paper proposes hiding authorization data from the delegatee. In our project, we implement a related practical countermeasure: we protect shared content integrity using digital signatures and recover from backup when leakage/tampering is detected.”

---

## Advantages

- Demonstrates IoT authorization leakage risk clearly
- Integrity verification using digital signature
- Automatic detection of tampered shared content
- Recovery mechanism using backup
- Separate roles: User, Server, Attacker
- Useful for academic demonstration and viva explanation

## Limitations (honest answer if asked)

- Academic simulation, not a full production IoT cloud
- Uses older JSP style (logic inside JSP pages)
- SHA-1 is outdated for modern production security (better: SHA-256 / HMAC)
- Hardcoded crypto key in attack path is only for demo
- SQL is often string-concatenated (SQL injection risk in real systems)
- Not a complete implementation of all 6 paper flaws; it focuses on leakage + integrity + recovery demo

---

## Likely Viva Questions and Short Answers

### 1. What is the title and aim of your project?

**Title:** Leakage of Authorization-Data in IoT Device Sharing: New Attacks and Countermeasure  

**Aim:** To study authorization-data leakage in IoT device sharing and demonstrate attack detection and recovery using digital signatures and backup.

### 2. What is authorization data in IoT sharing?

Data used to prove/allow access during device sharing, such as device ID, product ID, access token, or credentials related to delegated access.

### 3. What is the main attack shown?

A leakage/tampering attack where an attacker modifies shared document content. Because the SHA-1 signature changes, the system marks it as Not Safe.

### 4. How do you detect the attack?

By comparing the current digital signature in `documents` with the original signature in `metadata`. Mismatch means integrity is broken.

### 5. How do you recover?

Restore original content and signature from the `backup` table and set status to Safe.

### 6. Why Base64 encoding?

To store content in an encoded form instead of plain text, and to support encode/decode during attack/view flows.

### 7. Why SHA-1?

For academic integrity checking (hash of content). In industry we would prefer stronger algorithms like SHA-256.

### 8. What are the actors?

- **User** — authorized end user  
- **Server (IoT Cloud)** — admin/controller  
- **Attacker** — malicious party exploiting leakage  

### 9. Which tools/software did you use?

Java, JSP, Apache Tomcat, MySQL, HTML/CSS/JS, JDBC, BouncyCastle/crypto APIs.

### 10. What is the future enhancement?

- Stronger crypto (SHA-256, proper key management)
- Token hiding as in SecHARE applied to real IoT platforms
- Prepared statements / Spring Boot REST APIs
- Role-based access control and audit logging
- Real device APIs instead of document-sharing simulation

---

## 2–3 Minute Closing Speech (use in viva)

> Sir/Madam, my project is on leakage of authorization data in IoT device sharing. In IoT clouds, users share devices using delegation methods that often expose authorization certificates like device IDs and access tokens. If this data leaks, attackers can misuse shared access.
>
> To demonstrate this, I built a web application with three roles: User, IoT Cloud Server, and Attacker. The server uploads shared documents with Base64 encoding and SHA-1 digital signatures, and keeps a backup. Authorized users can search and access shared documents. The attacker module simulates a leakage attack by tampering with content, which changes the digital signature and marks the document as Not Safe.
>
> The countermeasure side of the project is detection and recovery: the server compares signatures with metadata and restores original content from backup. This shows how authorization-data leakage risks can be identified and mitigated in a practical system. The implementation uses Java JSP, Tomcat, and MySQL.

---

## Quick Checklist Before Viva Demo

- [ ] MySQL running and password matches `connect.jsp`
- [ ] Database `leakage_of_authorization` imported
- [ ] Project deployed under Tomcat `webapps/leakage`
- [ ] Tomcat started (port **8081** in this setup)
- [ ] Open home page successfully
- [ ] Server login works (`IOTCloud` / `IOTCloud`)
- [ ] User login works (`Akash` / `Akash`)
- [ ] Upload → Attack → Detect → Recover flow practiced once

---

## Project Folder Map

```text
iot-leakage/
├── explanation.md          ← this file
├── README.md
└── leakage/                ← web application root
    ├── index.html          ← home
    ├── connect.jsp         ← DB connection
    ├── User*.jsp           ← user module
    ├── Server*.jsp / S_*.jsp ← server module
    ├── attacker*.jsp / Leakageattack.jsp ← attacker module
    ├── recovered.jsp       ← recovery countermeasure
    ├── css/, js/, images/
    ├── Database/Database.txt
    └── WEB-INF/lib/        ← jar dependencies
```

---

*Prepared for MCA viva / practical examination. Keep answers short, use the demo flow, and relate every feature back to authorization-data leakage, detection, and recovery.*
