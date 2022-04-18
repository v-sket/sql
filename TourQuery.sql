create database QLTour
on(
	name = Tour_data,
	filename = 'E:\My stuffs\Projects\Code\SQL\Tour\Tour_data.mdf',
	size =  10,
	maxsize = 100,
	filegrowth = 10
)
log on(
	name = Tour_log,
	filename = 'E:\My stuffs\Projects\Code\SQL\Tour\Tour.ldf',
	size = 10,
	maxsize = 100,
	filegrowth = 10
)

create table Point(
	pointID nvarchar(10) primary key not null,
	pointName nvarchar(20),
)

create table Employee(
	employeeID nvarchar(10) primary key not null,
	employeeName nvarchar(20),
	employeeAddress nvarchar(30),
	employeeEmail nvarchar(20),
	employeePhone nvarchar(15)
)

create table Tour(
	tourID nvarchar(10) primary key not null,
	tourName nvarchar(20),
	numberOfCustomers int check (numberOfCustomers > 0),
	tourPrice money check (tourPrice > 0),
	startPointID nvarchar(10) foreign key references Point(pointID) not null,
	endPointID nvarchar(10) foreign key references Point(pointID) not null,
	startTime datetime,
	endTime dateTime,
	employeeID nvarchar(10) foreign key references Employee(employeeID) not null
)

create table Customer(
	customerID nvarchar(10) primary key not null,
	customerName nvarchar(20),
	customerAddress nvarchar(30),
	customerEmail nvarchar(20),
	customerPhone nvarchar(15),
	tourID nvarchar(10) foreign key references Tour(tourID) not null
)
