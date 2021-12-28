-- ON THIS FILECREATE INDEXES FOR TABLES FOR THE Paisley Event Association CASE 
-- CREATED BY AMARU KORPIMÄKI, TIIA MÄKINEN, AND MARCOS JANINI ALONSO
-- VERSION 1.0

-- INDEX FOR ARTIST
 CREATE INDEX ix_name_Artist ON Artist(name);

 --INDEX FOR VENUE
 CREATE INDEX ix_name_Venue ON  Venue(name);

 -- INDEX FOR EVENT
 CREATE INDEX ix_eventName_Event ON  Event(eventName);

 -- INDEX FOR BOOKING
 CREATE INDEX IX_numberOfTickets ON Booking(numberOfTickets);
