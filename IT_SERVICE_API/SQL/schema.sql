-- Users table
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  department VARCHAR(50),
  email VARCHAR(100)
);

-- Tickets table
CREATE TABLE tickets (
  ticket_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  issue_title VARCHAR(200),
  issue_description TEXT,
  status VARCHAR(20),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Ticket Logs table
CREATE TABLE ticket_logs (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  ticket_id INT,
  status VARCHAR(20),
  comment TEXT,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);