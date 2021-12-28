-- IN THIS FILE WE CREATE THE TEST FOR THE Paisley Event Association CASE
-- CREATED BY AMARU KORPIMÄKI, TIIA MÄKINEN, AND MARCOS JANINI ALONSO
-- VERSION 1.0

-- USER TRANSACTIONS 1-7

--1 BOOKIN A TICKET

INSERT INTO Booking (idEvent, numberOfTickets, status, clientPhoneNumber, bookingDate) 
VALUES (3, 4, 'B', '+358401030579', '2021-12-15');

-- 2 CHANGING THE NUMBER OF TICKETS 
UPDATE Booking
SET numberOfTickets= 3
WHERE idBooking=1 AND status NOT IN ('P', 'C');

-- 3 CANCELLING A TICKET BOOKING 
UPDATE Booking
SET status='C'
WHERE idBooking=5 AND status NOT IN ('P', 'C');

--4  CHANGING STATUS OF BOOKING TO PURCHASED ('P')
UPDATE Booking
SET status='P'
WHERE idBooking=1 AND status='B';

--5 REMOVING BOOKINGS AFTER 3 DAYS
DELETE FROM Booking
WHERE status='B' AND DATEDIFF(DAY, GETDATE(), bookingDate)<3;

--6 CANCELLING AN EVENT
UPDATE Event
SET status='OFF'
WHERE idEvent = 5;

--7 Refunding a client in case of a cancellend
SELECT idBooking, clientPhoneNumber, Booking.status, Event.price
FROM Booking
JOIN Event ON Event.idEvent=Booking.idEvent
WHERE  Event.status='OFF' AND Booking.status='P'

------------------------------------------------------------
-- USER TRANSACTIONS PART 2, 1-7

--1 

SELECT email
FROM Artist
WHERE name= 'Madonna'

-- 2

SELECT event.idevent, artist.idArtist, Artist.name, eventName, Event.date, (capacity - SUM(numberOfTickets)) AS 'Tickets left'
FROM Event
JOIN Venue
ON (Event.idVenue=Venue.idVenue)
JOIN Event_Artist
ON (Event.idEvent=Event_Artist.idEvent)
JOIN Booking
ON(Event.idEvent=Booking.idEvent)
JOIN Artist
ON(Event_Artist.idArtist=Artist.idArtist)
WHERE Artist.name = 'Madonna'-- AND Event.date ='2021-12-25'
GROUP BY  Artist.name, eventName, Event.date, capacity, numberOfTickets, event.idevent, artist.idArtist

--3

SELECT COUNT(eventName) AS 'Dance shows this month'
FROM Event
WHERE MONTH(Event.date) = MONTH(GETDATE()) AND status = 'ON' AND typeOfEvent = 'D' 

--4

SELECT Artist.name, Venue.name, Event.date, request
FROM Event
JOIN Venue
ON (Event.idVenue=Venue.idVenue)
JOIN Event_Artist
ON (Event.idEvent=Event_Artist.idEvent)
JOIN Artist
ON(Event_Artist.idArtist=Artist.idArtist)
WHERE Artist.name = 'Lordi' AND Venue.name ='Santa Club'
 
 --5

SELECT Artist.name, eventName, Event.date, SUM(numberOfTickets) AS 'Tickets sold'
FROM Event
JOIN Venue
ON (Event.idVenue=Venue.idVenue)
JOIN Event_Artist
ON (Event.idEvent=Event_Artist.idEvent)
JOIN Booking
ON(Event.idEvent=Booking.idEvent)
JOIN Artist
ON(Event_Artist.idArtist=Artist.idArtist)
WHERE Booking.status = 'P' AND Artist.name = 'Lordi' AND eventName = 'Christmas party' AND Event.date ='2021-12-23'
GROUP BY  Artist.name, eventName, Event.date,numberOfTickets

--6

SELECT SUM(Event.price) AS 'Total revenue'
FROM Event
JOIN Booking
ON(Event.idEvent=Booking.idEvent)
WHERE Booking.status = 'P' AND Event.status = 'ON' AND YEAR(Booking.bookingDate) = YEAR(GETDATE()) 

-- 7.1 THIS QUERY SHOWS THE TOTAL AMOUNT OF TICKETS SOLD BY ARTIST
SELECT Artist.name, sum(booking.numberOfTickets) AS 'Tickets sold'
FROM Event
LEFT OUTER JOIN Event_Artist
ON (Event.idEvent=Event_Artist.idEvent)
LEFT OUTER JOIN Booking
ON(Event.idEvent=Booking.idEvent)
LEFT OUTER JOIN Artist
ON(Event_Artist.idArtist=Artist.idArtist)
GROUP BY Artist.name

-- 7.2 WE HAD SOME ISSUES FINDING HOW TO WRITE THE QUERY TO SELECT THE ARTISTS THAT SOLD THE MOST
-- IT IS A PROBLEM OF NOT HAVING TOOLS TO MAKE ADVANCE QUERIES MORE THAN A PROBLEM OF DB DESGIN

SELECT MAX ('Tickets sold')
FROM (SELECT Artist.name, sum(booking.numberOfTickets) AS 'Tickets sold'
FROM Event
LEFT OUTER JOIN Event_Artist
ON (Event.idEvent=Event_Artist.idEvent)
LEFT OUTER JOIN Booking
ON(Event.idEvent=Booking.idEvent)
LEFT OUTER JOIN Artist
ON(Event_Artist.idArtist=Artist.idArtist)
GROUP BY Artist.name) 