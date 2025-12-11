-- OpenTicket procedure
DELIMITER //
CREATE PROCEDURE OpenTicket(IN uid INT, IN title VARCHAR(200), IN description TEXT)
BEGIN
  INSERT INTO tickets (user_id, issue_title, issue_description, status)
  VALUES (uid, title, description, 'Open');
END;
//
DELIMITER ;

-- UpdateTicketStatus procedure
DELIMITER //
CREATE PROCEDURE UpdateTicketStatus(IN tid INT, IN new_status VARCHAR(20), IN comment TEXT)
BEGIN
  UPDATE tickets SET status = new_status WHERE ticket_id = tid;
  INSERT INTO ticket_logs (ticket_id, status, comment)
  VALUES (tid, new_status, comment);
END;
//
DELIMITER ;

-- CloseTicket procedure
DELIMITER //
CREATE PROCEDURE CloseTicket(IN tid INT)
BEGIN
  UPDATE tickets SET status = 'Closed' WHERE ticket_id = tid;
  INSERT INTO ticket_logs (ticket_id, status, comment)
  VALUES (tid, 'Closed', 'Ticket closed');
END;
//
DELIMITER ;