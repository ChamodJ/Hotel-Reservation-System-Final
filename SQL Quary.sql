
/*Database For Online-reservation-system*/

create database online_reservation_system;

use online_reservation_system;

/*Create Tables*/

CREATE TABLE users (
  User_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  Username VARCHAR(100) NOT NULL,
  First_Name VARCHAR(100) ,
  Last_Name varchar(100),
  Email VARCHAR(100) NOT NULL,
  Address VARCHAR(200) NOT NULL,
  Mobile_no VARCHAR(15) NOT NULL,
  Date_of_birth date,
  Nationality VARCHAR(100) ,
  Gender varchar(30),
  password VARCHAR(40) NOT NULL,
   role VARCHAR(15) NOT NULL
);


CREATE TABLE Hotel (
  Hotel_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  Hotel_name VARCHAR(500) ,
  Location VARCHAR(150) NOT NULL,
  Contact_info VARCHAR(15) NOT NULL
);


CREATE TABLE Room (
  Room_Id VARCHAR(6) PRIMARY KEY,
  Hotel_id INTEGER NOT NULL,
  Type VARCHAR(50) NOT NULL,
  Price FLOAT NOT NULL,
  bed_count INTEGER NOT NULL,
  Total_rooms INTEGER NOT NULL,
  Reserved_room INTEGER NOT NULL
);

CREATE TABLE Reservaton (
  Reservaton_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  User_id INTEGER NOT NULL,
  Hotel_id INTEGER NOT NULL,
  Room_Id varchar(6) NOT NULL,
  check_in_date date NOT NULL,
  check_out_date date NOT NULL,
  reservation_date date NOT NULL,
  No_of_Gusts INTEGER NOT NULL,
  Amount FLOAT NOT NULL
);

ALTER TABLE Reservaton ADD FOREIGN KEY (User_id) REFERENCES users (User_id);
ALTER TABLE Reservaton ADD FOREIGN KEY (Hotel_id) REFERENCES Hotel (Hotel_id);
ALTER TABLE Reservaton ADD FOREIGN KEY (Room_Id) REFERENCES Room (Room_Id);
ALTER TABLE Room ADD FOREIGN KEY (Hotel_id) REFERENCES Hotel (Hotel_id);




/*INSERT VALUES*/

/*Hotel Table */
insert into Hotel value (001,"Scenic Ridge","Galle","011-1234567");
insert into Hotel value (0,"Scenic Ridge","Benthota","011-7894561");
insert into Hotel value (0,"Scenic Ridge","Colombo","011-5689562");
insert into Hotel value (0,"Scenic Ridge","Jaffana","011-7859526");

/*Room Table*/
insert into Room value ('GFM',001,'Family Room', 16000.00, 2, 30, 0);
insert into Room value ('GPS',001,'Presidential Suite', 200000.00, 1, 1, 0);
insert into Room value ('GHS',001,'Honeymoon Suite', 160000.00, 1, 2, 0);
insert into Room value ('GDR',001,'Deluxe Rooms', 25000.00, 2, 40, 0);
insert into Room value ('BFM',002,'Family Room', 16000.00, 2, 50, 0);
insert into Room value ('BPS',002,'Presidential Suite', 200000.00, 5, 4, 0);
insert into Room value ('BHS',002,'Honeymoon Suite', 160000.00, 1, 5, 0);
insert into Room value ('BDR',002,'Deluxe Rooms', 25000.00, 2, 40, 0);
insert into Room value ('BVS',002,'Villa Suite', 100000.00, 1, 15, 0);
insert into Room value ('CFM',003,'Family Room', 20000.00, 2, 50, 0);
insert into Room value ('CPS',003,'Presidential Suite', 230000.00, 1, 6, 0);
insert into Room value ('CHS',003,'Honeymoon Suite', 200000.00, 1, 5, 0);
insert into Room value ('CDR',003,'Deluxe Rooms', 30000.00, 2, 40, 0);
insert into Room value ('JFM',004,'Family Room', 12000.00, 2, 40, 0);
insert into Room value ('JPS',004,'Presidential Suite', 120000.00, 1, 2, 0);
insert into Room value ('JHS',004,'Honeymoon Suite', 120000.00, 1, 2, 0);
insert into Room value ('JDR',004,'Deluxe Rooms', 18000.00, 2, 40, 0);

/*User Table*/
insert into users (User_id,Username,Email,Address,Mobile_no,password,role) value (0, "admin1" , "admin1@gmail.com", "Somewhere","75846548","admin", "admin");
insert into users (User_id,Username,Email,Address,Mobile_no,password,role) value (0, "admin2" , "admin2@gmail.com", "Somewhere","78545964","admin", "admin");
insert into users (User_id,Username,Email,Address,Mobile_no,password,role) value (0, "Saman" , "Saman@gmail.com", "Somewhere","78545964","12345", "user");
insert into users (User_id,Username,Email,Address,Mobile_no,password,role) value (0, "Kamal" , "Kamal@gmail.com", "Somewhere","78545964","12345", "user");

/*Reservation Table*/
INSERT INTO Reservaton (User_id, Hotel_id, Room_Id, check_in_date, check_out_date, reservation_date, No_of_Gusts, Amount) VALUES (1, 1, 'GFM', '2023-11-01', '2023-11-03', '2023-10-28', 2, 32000.00);
INSERT INTO Reservaton (User_id, Hotel_id, Room_Id, check_in_date, check_out_date, reservation_date, No_of_Gusts, Amount) VALUES (2, 1, 'GHS', '2023-11-02', '2023-11-05', '2023-10-29', 1, 160000.00);
INSERT INTO Reservaton (User_id, Hotel_id, Room_Id, check_in_date, check_out_date, reservation_date, No_of_Gusts, Amount) VALUES (3, 3, 'CHS', '2023-11-04', '2023-11-06', '2023-10-31', 1, 200000.00);
INSERT INTO Reservaton (User_id, Hotel_id, Room_Id, check_in_date, check_out_date, reservation_date, No_of_Gusts, Amount) VALUES (4, 4, 'JFM', '2023-11-05', '2023-11-07', '2023-11-01', 2, 24000.00);