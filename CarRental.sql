/*Create following tables in SQL Schema with appropriate class and write the unit test case for the
application.
SQL Tables:
1. Customer Table:
• CustomerID (Primary Key): Unique identifier for each customer.
• FirstName: First name of the customer.
• LastName: Last name of the customer.
• Email: Email address of the customer for communication.
• PhoneNumber: Contact number of the customer.
• Address: Customer's residential address.
• Username: Unique username for customer login.
• Password: Securely hashed password for customer authentication.
• RegistrationDate: Date when the customer registered.
*/


CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1, 1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    RegistrationDate DATETIME NOT NULL
);

/*

2. Vehicle Table:
• VehicleID (Primary Key): Unique identifier for each vehicle.
• Model: Model of the vehicle.
• Make: Manufacturer or brand of the vehicle.
• Year: Manufacturing year of the vehicle.
• Color: Color of the vehicle.
• RegistrationNumber: Unique registration number for each vehicle.
• Availability: Boolean indicating whether the vehicle is available for rent.
• DailyRate: Daily rental rate for the vehicle.*/

CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY IDENTITY(1, 1),
    Model VARCHAR(50) NOT NULL,
    Make VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Color VARCHAR(20) NOT NULL,
    RegistrationNumber VARCHAR(20) NOT NULL,
    Availability BIT NOT NULL,
    DailyRate DECIMAL(5, 2) NOT NULL
);

/*
3. Reservation Table:
• ReservationID (Primary Key): Unique identifier for each reservation.
• CustomerID (Foreign Key): Foreign key referencing the Customer table.
• VehicleID (Foreign Key): Foreign key referencing the Vehicle table.
• StartDate: Date and time of the reservation start.
• EndDate: Date and time of the reservation end.
• TotalCost: Total cost of the reservation.
• Status: Current status of the reservation (e.g., pending, confirmed, completed).
*/

CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY IDENTITY(1, 1),
    CustomerID INT NOT NULL,
    VehicleID INT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

/*
4. Admin Table:
• AdminID (Primary Key): Unique identifier for each admin.
• FirstName: First name of the admin.
• LastName: Last name of the admin.
• Email: Email address of the admin for communication.
• PhoneNumber: Contact number of the admin.
• Username: Unique username for admin login.
• Password: Securely hashed password for admin authentication.
• Role: Role of the admin within the system (e.g., super admin, fleet manager).
• JoinDate: Date when the admin joined the system.
*/
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1, 1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL,
    JoinDate DATETIME NOT NULL
);


insert into Customer values 
('Jai','Dev','jd@example.com',4644567890,'Palasa, Srikakulam','JaiJD','jd30012','2024-07-06'),
('Reeha','Mary','rme@example.com',2744456890,'Gaajuwaka, Vizag','ReehaM','reeh34','2024-07-06');

insert into Vehicle values
('Civic','Volkswagen','2018','Red','ABCD123',1,50.00),
('Virtus','Honda','2022','Black','CDEF582',0,70.00);

insert into Reservation values
(1,1,'2024-07-22','2024-04-24',150.00,'Completed'),
(2,2,'2024-08-12','2024-08-15',280.00,'Confirmed');

insert into [Admin] values
('Swathi','Rani','srm@example.com',9234456139,'SwathiR','rani1234','DB Admin','2024-02-07'),
('Akshay','RK','ark@example.com',6356134572,'akshRK','aksh567','Admin','2024-04-22');





select * from Customer;
select * from Vehicle;
select * from Admin;
select * from Reservation;

delete from Vehicle where VehicleID = 4


delete from Admin where AdminID = 3
delete from Customer where FirstName = 'UVW'

Select ReservationID,Reservation.CustomerID,VehicleID, StartDate,EndDate,TotalCost,Status from Reservation join Customer on Reservation.CustomerID = Customer.CustomerID
where Customer.Username = 'ReehaM';