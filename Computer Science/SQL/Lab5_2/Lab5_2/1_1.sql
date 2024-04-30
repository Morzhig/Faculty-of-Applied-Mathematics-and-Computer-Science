CREATE DATABASE CarRentalDB
ON
(
	NAME = 'CarRental_data',
	FILENAME = "D:\Programming\SQL\Lab5_2\rental.mdf",
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)
LOG ON
( 
	NAME = 'CarRental_log',
	FILENAME = 'D:\Programming\SQL\Lab5_2\rental.ldf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5%
)