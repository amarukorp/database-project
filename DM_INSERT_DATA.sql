
-- IN THIS FILE WE INSERT THE DATA ONTO THE TABLES FOR Paisley Event Association CASE
-- CREATED BY AMARU KORPIMÄKI, TIIA MÄKINEN, AND MARCOS JANINI ALONSO
--VERSION 1.0

-- ARTIST
INSERT INTO Artist (name, email, phone, request) VALUES 
('Madonna', 'queenofpop@madonna.com', '+34696669696', 'Chocolates and golden toilet'),
('Lordi', 'lordi@hardrock.fi', '+35866666666', 'Fire all over the place'),
('Bolshoi Ballet', 'bolshoi@bolshoiballet.ru', '+3845454598', 'Vodka and ice'),
('Broadway shows', 'contracts@broadway.com', '+3845344598', NULL),
('Antti Tuisku', 'management@anttituisku.com', '+35840854321', 'Golden glitter'),
('Sami Arts', 'arts@sami.fi', '+3584123456',NULL),
('J Balvin', 'jose@jbalvin.com', '+3367823456', NULL);

-- VENUE
INSERT INTO Venue (name, address, capacity) VALUES 
('Olimpic Stadium', 'Olimpickatu 22, Helsinki', '1200'),
('Santa Club', 'Lordi Square 2, Rovaniemi', '600'),
('Kallisteateri', 'Rautatientori 3, Helsinki', '120');


-- EVENT
INSERT INTO Event (eventName, date, price, idVenue, typeOfEvent, status) VALUES 
('Juhannus fest', '2022-06-21', 105.00, 1, 'C', 'ON'), 
('Swan Lake', '2021-12-25', 85.50, 3, 'D', 'OFF'), 
( 'Swan Lake', '2022-01-11', 85.50, 3, 'D', 'ON'), 
('Lion King', '2022-02-08', 120.50, 3, 'T', 'ON'), 
('Christmas party', '2021-12-23', 29.90, 2, 'C', 'ON');

-- BOOKING
INSERT INTO Booking (idEvent, numberOfTickets, status, clientPhoneNumber, bookingDate) VALUES 
(2, 2, 'B', '+358401234567','2021-12-25'),
(2, 1, 'P', '+358401234577','2021-11-29'),
(3, 1, 'C', '+358401234777','2021-11-10'),
(4, 2, 'P', '+358401234877','2021-12-13'),
(5, 2, 'B', '+358401234579','2021-12-15'),
(6, 4, 'C', '+358401234551','2021-12-11'),
(6, 1, 'P', '+358401234510','2021-10-25');


-- EVENT_ARTIST
INSERT INTO Event_Artist (idEvent, idArtist) VALUES 
(2, 5),
(2, 1),
(3, 3),
(4, 3),
(5, 6),
(6, 2),
(6, 5);
