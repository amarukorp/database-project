
-- IN THIS FILE WE CREATE THE TABLES FOR Paisley Event Association CASE
-- CREATED BY AMARU KORPIMÄKI, TIIA MÄKINEN, AND MARCOS JANINI ALONSO
-- VERSION 1.0

-- ARTIST TABLE
CREATE TABLE Artist
(
	idArtist INTEGER NOT NULL IDENTITY,
	name VARCHAR(40) NOT NULL,
	email VARCHAR(40) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	request VARCHAR(120),

	CONSTRAINT PK_Artist PRIMARY KEY(idArtist),
	);

--VENUE TABLE
CREATE TABLE Venue
(
	idVenue INTEGER NOT NULL IDENTITY,
	name VARCHAR(40) NOT NULL,
	address VARCHAR(40) NOT NULL,
	capacity INTEGER NOT NULL,

	CONSTRAINT PK_Venue PRIMARY KEY (idVenue)

);
-- EVENT TABLE
CREATE TABLE Event
(
  idEvent	INTEGER		NOT NULL IDENTITY,
  eventName	VARCHAR(40)		NOT NULL,
  date		DATE		NOT NULL,
  price		DECIMAL (6,2)		NOT NULL,
  idVenue	INTEGER		NOT NULL,
  typeOfEvent	CHAR(1)		NOT NULL,
  status		VARCHAR(3)		NOT NULL,

  CONSTRAINT PK_Event PRIMARY KEY (idEvent),
  CONSTRAINT FK_Event FOREIGN KEY (idVenue) 
	REFERENCES Venue(idVenue),  
  CONSTRAINT CHK_typeOfEvent CHECK(typeOfEvent in ('C','D','T')),
  CONSTRAINT CHK_status_Event CHECK(status = 'ON' OR status = 'OFF')
);


-- BOOKING TABLE
CREATE TABLE Booking
(
  idBooking		INTEGER		NOT NULL IDENTITY,
  idEvent		INTEGER		NOT NULL,
  numberOfTickets	INTEGER		NOT NULL,
  status		CHAR(1)		NOT NULL,
  clientPhoneNumber	VARCHAR(15)		NOT NULL,
  bookingDate DATE NOT NULL,

  CONSTRAINT PK_Booking PRIMARY KEY (idBooking),
  CONSTRAINT FK_Booking FOREIGN KEY (idEvent) 
      REFERENCES Event(idEvent),  
  CONSTRAINT CHK_status_Booking CHECK(status in('B', 'P', 'C'))
);


-- Event_Artist TABLE
CREATE TABLE Event_Artist
(
	idEvent INTEGER NOT NULL,
	idArtist INTEGER NOT NULL,

	CONSTRAINT PK_Event_Artist PRIMARY KEY (idEvent, idArtist),
	CONSTRAINT FK_Event_Artist_Event FOREIGN KEY (idEvent)
		REFERENCES Event(idEvent),
	CONSTRAINT FK_Event_Artist_Artist FOREIGN KEY (idArtist)
		REFERENCES Artist(idArtist),
);


select event.idEvent, idBooking, booking.status, event.status from booking join event on event.idEvent=Booking.idEvent

select * from Booking
select * from artist
select * from event