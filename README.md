# **Database project: "Paisley Event Association"**
Project created during the **Data management and databases** course at **Haaga-Helia.** The project was created by [Amaru Korpimäki](https://github.com/amarukorp), [Tiia Mäkinen](https://github.com/tiiamakinen), and [Marcos Janini Alonso.](https://github.com/marcosjanini)



This project shows the result of creating a relational database from scratch. This repository holds the results of the holds process of database design and implementation.

---

The database was built using ***MS SQL Server*** based on the SQL standard, *the queries might be compatible with other Relational database management systems but please check the compatibility of the queries yourself.*

## **Requirements**
### Introduction
Paisley Event Association is a small non-profit association organizing a few local concerts, dance and theatre performances and other cultural events yearly. So far, tickets have been sold in person at the Paisley tourist office. Now the association is keen on offering web pages, where clients could see upcoming events and book tickets.
In the first phase, tickets can be only booked online. When a client makes a booking, they should get a unique booking number. The client should purchase the booked tickets within three days from booking at Paisley tourist office or Paisley Library.

### Further Details
Further details
* Paisley Event Association has three venues to hold its events. The smallest venue accommodates 120 people. The other venues accommodate 600 and 1200 people. It is possible that other venues may become available in the future.
* All tickets to a certain event are sold at the same price.
* Different events may be priced differently.
* Seats are not numbered.
* Ticket numbers are not saved in the database.
* The fire safety regulations do not allow any overbooking.
* An event can also include performances from several different artists.
* Popular performers visit Paisley often. Paisley Event Association has a registry of domestic and foreign artists with their contact information (email, phone) and special requests for catering and refreshments.
* Booked tickets are identified and purchased by booking number.
* One booking can only contain tickets to one event.
* A booking can be cancelled, unless it has already been already purchased (payed for).
* The number of tickets in a booking can be changed, unless the tickets are already purchased.
* Once the tickets are purchased, they can neither be changed nor refunded (except for event cancellation).
* If the event is cancelled, the client can receive a refund of the amount paid for the ticket. The refund is given in person at Paisley Library.
* All the tickets included in the same booking must be purchased at the same time.
* Only the client's phone number is registered in a booking. NB! No other about clients are stored in the database.


The new database application should help to complete the tasks (user transactions) listed below

1. Booking tickets
2. Changing the number of tickets in a booking
3. Cancelling a ticket booking
4. Changing the status of booking to sold when tickets are purchased (the booking is payed for)
5. Removing unpurchased bookings from the database after three days from booking.
6. Cancelling an event (in an extreme exceptional case)
7. Refunding a client in a case of a cancelled event.



## **ER Diagram**
This Diagram explains the basic schema of the database more details on the file [DM_Case_DB_Design](https://github.com/amarukorp/database-project/blob/main/DM_Case_DB_Design.pdf)

![Er Diagram](DB_Diagrams\ER_diagram.jpg)

## **How to make use of the database**

In order to use the database, download MS SQL Server (or similar but check the compatibility of the queries). and execute the query files in the following order.

1. [DM_CREATE_TABLES.sql](https://github.com/amarukorp/database-project/blob/main/DM_CREATE_TABLES.sql)
1. [DM_INSERT_DATA.sql](https://github.com/amarukorp/database-project/blob/main/DM_INSERT_DATA.sql)
1. [DM_INDEXES.sql](https://github.com/amarukorp/database-project/blob/main/DM_INDEXES.sql)
1. [DM_Test_Queries.sql (Optional)](https://github.com/amarukorp/database-project/blob/main/DM_Test_Queries.sql)

The result of run these queries on the database management system will provide you the following database with a basic set of data.

![DataBase Model](DB_Diagrams\Database_model.jpg)
---

For more information about the database please review the file [DM_Case_DB_Design](https://github.com/amarukorp/database-project/blob/main/DM_Case_DB_Design.pdf)
