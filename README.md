# Campus-Skill-Exchange-Portal
> 🚧 This project is currently under development with new features being added.
A web-based platform that allows students to showcase their skills, discover skills from other users, and request learning opportunities through a structured request system.

---

## 🚀 Features

* 🔐 User Authentication (Login/Logout)
* ➕ Add, View, Edit, Delete Skills
* 🔍 Search Skills by keyword
* 👥 View other users’ skills
* 📩 Send skill learning requests
* 📬 View received requests
* ✔ Accept / ❌ Reject requests
* 🚫 Prevent unauthorized edit/delete actions

---

## 🛠 Tech Stack

* **Frontend:** HTML, CSS, Bootstrap
* **Backend:** Java (Servlets, JSP)
* **Database:** MySQL
* **Architecture:** MVC (Model-View-Controller)
* **IDE:** VS Code

---

## 📂 Project Structure

```
com.campusSkill
│
├── controller
│   ├── LoginServlet.java
│   ├── AddSkillServlet.java
│   ├── DeleteServlet.java
│   ├── SearchServlet.java
│   ├── RequestSkillServlet.java
│   └── ViewRequestServlet.java
│
├── dao
│   ├── UserDAO.java
│   ├── AddSkillDAO.java
│   └── RequestDAO.java
│
├── model
│   ├── User.java
│   ├── Skills.java
│   └── Request.java
│
└── jsp
    ├── dashboard.jsp
    ├── viewSkill.jsp
    ├── editSkill.jsp
    └── viewRequest.jsp
```

---

## 🧠 How It Works

1. User logs into the system
2. Adds and manages their own skills
3. Searches for skills added by other users
4. Sends a request to learn a skill
5. Receiver can accept or reject the request

---

## 🗄 Database Tables

### 🔹 Users

* id
* name
* email
* password

### 🔹 Skills

* skill_id
* skillname
* level
* description
* availability
* status
* owner_user

### 🔹 Requests

* request_id
* senderId
* receiverId
* skill_id
* status (pending / accepted / rejected)

---

## ⚙️ Setup Instructions

1. Clone the repository
2. Import project into your IDE
3. Configure database in `connectionProvider`
4. Run the project on Apache Tomcat server
5. Open browser:

   ```
   http://localhost:8080/YourProjectName
   ```

---

## 💡 Key Highlights

* Secure session-based user handling
* Clean separation using MVC architecture
* Dynamic UI rendering using JSP
* Efficient database interaction using JDBC
* Real-world feature: skill request system

---

## 📌 Future Enhancements

* 🔔 Notification system
* 💬 Chat between users
* ⭐ Rating & feedback system
* 📧 Email alerts

---

## 👩‍💻 Author

**Bhumika Sen**
MCA Student | Java Full Stack Developer

---

## 📜 License

This project is for educational purposes.
