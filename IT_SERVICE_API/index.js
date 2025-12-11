const express = require('express');
const mysql = require('mysql2');
const app = express();

app.use(express.json());

// ------------------- MySQL Connection -------------------
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',          // change if your MySQL user is different
  password: '',          // add your MySQL password if set
  database: 'it_service_management'
});

db.connect(err => {
  if (err) throw err;
  console.log('✅ Connected to MySQL');
});

// ------------------- CREATE TICKET -------------------
app.post('/tickets', (req, res) => {
  const { user_id, issue_title, issue_description } = req.body;
  const sql = 'CALL OpenTicket(?, ?, ?)';
  db.query(sql, [user_id, issue_title, issue_description], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Ticket created successfully' });
  });
});

// ------------------- UPDATE TICKET STATUS -------------------
app.put('/tickets/:id/status', (req, res) => {
  const ticketId = req.params.id;
  const { status, comment } = req.body;
  const sql = 'CALL UpdateTicketStatus(?, ?, ?)';
  db.query(sql, [ticketId, status, comment], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Ticket status updated' });
  });
});

// ------------------- CLOSE TICKET -------------------
app.post('/tickets/:id/close', (req, res) => {
  const ticketId = req.params.id;
  const sql = 'CALL CloseTicket(?)';
  db.query(sql, [ticketId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Ticket closed successfully' });
  });
});

// ------------------- REPORTS -------------------
app.get('/reports/tickets-by-department', (req, res) => {
  const sql = `
    SELECT u.department, COUNT(t.ticket_id) AS ticket_count
    FROM users u
    JOIN tickets t ON u.user_id = t.user_id
    GROUP BY u.department
  `;
  db.query(sql, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(result);
  });
});

// ------------------- SERVER LISTEN -------------------
app.listen(3000, () => {
  console.log('🚀 Server running on http://localhost:3000');
});