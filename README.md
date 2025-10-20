# 🧾 Employee Assessment System (Delphi VCL)

A mini-project built using **Delphi Embarcadero RAD Studio** and **MySQL** that enables employee assessment and project management between **Admin**, **Manager**, and **Employee** roles.

---

## 📋 Project Description

This is a desktop-based **Employee Assessment System** designed to simplify project and employee management.  
It allows administrators to manage projects and users, managers to assess employees, and employees to view their assigned work and assessments.
The system also includes **email functionality** to notify employees about new projects or assessment updates.

---

## 👥 User Roles

### 🛠️ Admin
- Creates and manages projects  
- Assigns employees and managers  
- Manages user accounts (Manager / Employee)

### 👨‍💼 Manager
- Views assigned projects  
- Assesses employees based on criteria dynamically based on role
- Sends email notifications to employees after assessment

### 👨‍💻 Employee
- Views assigned projects  
- Views assessments and feedback  

---

## 🧩 Technologies Used

| Component | Description |
|------------|-------------|
| **Language** | Object Pascal (Delphi) |
| **Framework** | VCL (Visual Component Library) |
| **Database** | MySQL |
| **Connectivity** | ADO + ODBC DSN |
| **UI Components** | Forms, Panels, Buttons, Edit Controls |

---

## ⚙️ Setup Instructions

### 1️⃣ Prerequisites

- **Delphi Embarcadero RAD Studio** (any version with ADO support)  
- **MySQL Server** installed and running  
- **MySQL ODBC Connector (32-bit)**  
  👉 [Download Connector](https://dev.mysql.com/downloads/connector/odbc/)

---

### 2️⃣ Configure ODBC DSN

Open **ODBC Data Source Administrator (32-bit)**  
Path: `C:\Windows\SysWOW64\odbcad32.exe`

Go to **System DSN → Add → MySQL ODBC 8.0 ANSI Driver** and fill:

```
Data Source Name: EmployeeDSN
Server: 127.0.0.1
Database: employee_assessment
User: root
Password: (your password)
```

✅ Click **Test Connection** → should show *Connection Successful*  

---

### 3️⃣ Configure Delphi Project

Open the project (`EmployeeAssessmentDemo.dproj`) in **Delphi**.  
Then open the **Data Module (`DMMain.pas`)** and set the connection string:

```pascal
Provider=MSDASQL.1;Persist Security Info=False;Data Source=EmployeeDSN;
```

Right-click `ADOConnection1` → **Test Connection** → should succeed.

---

### 4️⃣ Run the Application

Press **F9** in Delphi to run the project.

---

## 🧑‍💻 Author
**Shravan A.**  
🎯 GitHub: [@Shravan103](https://github.com/Shravan103)  
📧 For feedback or collaboration, feel free to reach out!

---

## 🏁 License
Open-source for educational purposes.
