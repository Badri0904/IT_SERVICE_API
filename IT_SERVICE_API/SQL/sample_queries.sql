-- Latest status per ticket
SELECT t.ticket_id, t.issue_title,
       (SELECT status FROM ticket_logs WHERE ticket_id = t.ticket_id ORDER BY updated_at DESC LIMIT 1) AS latest_status
FROM tickets t;

-- Ticket count by status
SELECT status, COUNT(*) AS count FROM tickets GROUP BY status;

-- Tickets by department
SELECT u.department, COUNT(t.ticket_id) AS ticket_count
FROM users u
JOIN tickets t ON u.user_id = t.user_id
GROUP BY u.department;