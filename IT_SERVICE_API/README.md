# IT Service Ticket Management System

This is a simple backend project I built to practice **SQL, DBMS, APIs, and real-world data handling**.  
It manages IT support tickets inside a company — including creating tickets, updating ticket status, closing tickets, and generating department-wise reports.

---

## 📌 What the Project Does
- Add a new IT ticket  
- Change ticket status with comments  
- Close a ticket  
- View total tickets raised by each department  
- Store all data in MySQL  
- Test every API using Postman  

---

## 🛠️ Technologies Used
- **Node.js + Express** → API backend  
- **MySQL** → Database  
- **Postman** → API testing  

---

## 🗄️ Database Tables
**Users**
- `id`
- `name`
- `department`
- `email`

**Tickets**
- `id`
- `title`
- `description`
- `status`
- `user_id`
- `created_at`

**Ticket_Logs**
- `id`
- `ticket_id`
- `status`
- `comment`
- `updated_at`

---

## 🔗 API Endpoints
- **Create a Ticket** → `POST /tickets`  
- **Update Ticket Status** → `PUT /tickets/:id/status`  
- **Close a Ticket** → `POST /tickets/:id/close`  
- **Tickets by Department** → `GET /reports/tickets-by-department`  

---

## ⚙️ How to Run
1. Install **Node.js**  
2. Install **MySQL**  
3. Open project folder in **VS Code**  
4. Run:
   ```bash
   npm install
   node index.js