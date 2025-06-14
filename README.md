# 👩‍💼 Employee Management System (EMS)

The **Employee Management System** is a robust and scalable enterprise application built to streamline and modernize Human Resource operations within organizations. Developed using **Spring Boot**, **Hibernate**, **JSP**, **Servlets**, **HTML**, **CSS**, **JavaScript**, **JDBC**, **SQL**, and **Eureka Server**, EMS offers a comprehensive solution for employee record management, payroll handling, and performance tracking.

---

## 📌 Introduction

This project leverages a full-stack Java architecture and follows best practices in modular design and service-oriented architecture:

- **Spring Boot** for rapid backend development
- **Hibernate** (ORM) for seamless database interaction
- **JSP & Servlets** for rendering dynamic pages and handling requests
- **HTML, CSS, JS** for front-end UI
- **JDBC + SQL** for raw and efficient data manipulation
- **Eureka Server** for microservice registration and discovery

The system is optimized for performance, user experience, and maintainability.

---

## 🚀 Features

- 👥 Create, Read, Update, Delete (CRUD) Employee Records
- 🗂 Admin and Employee login system
- 📊 Dashboard with employee stats
- 🧾 Salary and performance management
- 🧩 Microservice-based architecture
- 🔍 Service discovery with Eureka Server
- 🌐 Responsive UI with intuitive navigation

---

## 🛠️ Technology Stack

| Layer         | Technologies Used                                                                 |
|---------------|------------------------------------------------------------------------------------|
| Backend       | Java, Spring Boot, Hibernate, JSP, Servlets, JDBC                                  |
| Frontend      | HTML5, CSS3, JavaScript                                                            |
| Database      | MySQL                                                                              |
| Architecture  | Microservices with Eureka Server                                                   |
| Tools         | Eclipse IDE, MySQL Workbench                                                       |

---

## 🧪 How to Set Up the Project

### ⚙️ Prerequisites

- Java 17+
- Maven
- Eclipse IDE
- MySQL
- Internet connection to download dependencies

### 📂 Steps

1. **Download the project ZIP** and unzip it.
2. Open **Eclipse IDE** → `File` → `Open Projects from File System...`
3. Select the **unzip folder** and import it.
4. In **MySQL Workbench**, create a database:
   ```sql
   CREATE DATABASE EmployeeManagementDB;
Wait for Eclipse to finish importing and downloading dependencies.

Run services individually in the following order:

✅ Registry Service (Eureka Server)

✅ Administrator Service

✅ Create Employee Service

✅ Delete Employee Service

✅ Read All Employee Service

✅ Update Employee Service

✅ Frontend Service

Open http://localhost:8761 to view Eureka dashboard and confirm that all services are registered.

Access the web UI by visiting:

arduino
Copy
Edit
http://localhost:8080/
🎨 Front-End Design
🏠 Home Page (Port 8080)
Includes a navigation bar with:

Services

About Us

Contact Us

Admin/Employee Login

Logout

Under Services, you can:

Perform CRUD operations

Access the dashboard and other modules
![image](https://github.com/user-attachments/assets/02f234d8-4d1b-456a-b391-4a556be65b3d)
