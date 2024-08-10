CREATE DATABASE courier_managenment_system;

USE courier_managenment_system;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY ,
    Name VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(20),
    VehicleType VARCHAR(50)
);

CREATE TABLE Parcel (
    ParcelID INT PRIMARY KEY,
    Weight DECIMAL(10, 2),
    Dimensions VARCHAR(50),
    Type VARCHAR(50),
    Status VARCHAR(50),
    SenderID INT,
    ReceiverID INT,
    FOREIGN KEY (SenderID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ReceiverID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    TrackingNumber VARCHAR(50),
    DeliveryDate DATE,
    Status VARCHAR(50),
    CourierID INT,
    ParcelID INT,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (ParcelID) REFERENCES Parcel(ParcelID)
);

CREATE TABLE Route (
    RouteID INT PRIMARY KEY,
    StartLocation VARCHAR(100),
    EndLocation VARCHAR(100),
    Distance DECIMAL(10, 2),
    CourierID INT,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    Method VARCHAR(50),
    CustomerID INT,
    DeliveryID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (DeliveryID) REFERENCES Delivery(DeliveryID)
);



INSERT INTO Customer (CustomerID, Name, Address, PhoneNumber, Email) VALUES
(1, 'Alice Smith', '123 Maple Street', '555-1234', 'alice.smith@example.com'),
(2, 'Bob Johnson', '456 Oak Avenue', '555-5678', 'bob.johnson@example.com'),
(3, 'Carol Davis', '789 Pine Road', '555-8765', 'carol.davis@example.com');

INSERT INTO Courier (CourierID, Name, PhoneNumber, VehicleType) VALUES
(1, 'David Brown', '555-4321', 'Van'),
(2, 'Eve White', '555-6789', 'Motorbike'),
(3, 'Frank Green', '555-9876', 'Truck');

INSERT INTO Parcel (ParcelID, Weight, Dimensions, Type, Status, SenderID, ReceiverID) VALUES
(1, 2.5, '10x10x10', 'Electronics', 'In Transit', 1, 2),
(2, 5.0, '20x15x10', 'Clothing', 'Delivered', 2, 3),
(3, 1.2, '15x10x5', 'Books', 'Pending', 3, 1);

INSERT INTO Delivery (DeliveryID, TrackingNumber, DeliveryDate, Status, CourierID, ParcelID) VALUES
(1, 'TRACK123456', '2024-08-01', 'Delivered', 1, 2),
(2, 'TRACK789012', '2024-08-05', 'In Transit', 2, 1),
(3, 'TRACK345678', '2024-08-10', 'Pending', 3, 3);

INSERT INTO Route (RouteID, StartLocation, EndLocation, Distance, CourierID) VALUES
(1, '123 Maple Street', '456 Oak Avenue', 15.2, 1),
(2, '456 Oak Avenue', '789 Pine Road', 20.0, 2),
(3, '789 Pine Road', '123 Maple Street', 18.5, 3);

INSERT INTO Payment (PaymentID, Amount, PaymentDate, Method, CustomerID, DeliveryID) VALUES
(1, 50.00, '2024-08-02', 'Credit Card', 2, 1),
(2, 30.00, '2024-08-06', 'PayPal', 1, 2),
(3, 25.00, '2024-08-11', 'Debit Card', 3, 3);