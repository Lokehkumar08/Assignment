
CREATE DATABASE MovieBookingSystem;
USE MovieBookingSystem;

-- Admin Table
CREATE TABLE Admin (
    adminID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

-- User Table
CREATE TABLE User (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

-- Movie Table
CREATE TABLE Movie (
    movieID INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    genre VARCHAR(255),
    language VARCHAR(50),
    duration FLOAT
);

-- Theater Table
CREATE TABLE Theater (
    theaterID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    location VARCHAR(255),
    screens INT
);

-- Show Table
CREATE TABLE Show (
    showID INT PRIMARY KEY AUTO_INCREMENT,
    movieID INT,
    theaterID INT,
    timing DATETIME,
    availableSeats INT,
    FOREIGN KEY (movieID) REFERENCES Movie(movieID),
    FOREIGN KEY (theaterID) REFERENCES Theater(theaterID)
);

-- Booking Table
CREATE TABLE Booking (
    bookingID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    showID INT,
    seatsBooked INT,
    totalAmount FLOAT,
    bookingStatus VARCHAR(50),
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (showID) REFERENCES Show(showID)
);

-- Payment Table
CREATE TABLE Payment (
    paymentID INT PRIMARY KEY AUTO_INCREMENT,
    bookingID INT,
    amount FLOAT,
    paymentStatus VARCHAR(50),
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID)
);

-- Payment Confirmation Table
CREATE TABLE PaymentConfirmation (
    confirmationID INT PRIMARY KEY AUTO_INCREMENT,
    bookingID INT,
    paymentStatus VARCHAR(50),
    ticketDetails TEXT,
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID)
);

-- Booking Notification Table
CREATE TABLE BookingNotification (
    notificationID INT PRIMARY KEY AUTO_INCREMENT,
    bookingID INT,
    userID INT,
    message TEXT,
    FOREIGN KEY (bookingID) REFERENCES Booking(bookingID),
    FOREIGN KEY (userID) REFERENCES User(userID)
);
