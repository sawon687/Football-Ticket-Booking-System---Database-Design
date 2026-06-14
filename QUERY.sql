--  database create
create database bookingsystem

DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users
--  user table create
create table users(
  users_id serial primary key,
  full_name  varchar(50) not null,
  email varchar(100) unique not null,
  phone_number varchar(20),
  role varchar(20) check(role in ('Ticket Manager ','Football Fan')) not null
   
)

  -- user data insert 
insert into Users(user_id,full_name,email,role,phone_number)
  values
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);



-- Match table create 
CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(100) not null,
    tournament_category varchar(100) not null,
    base_ticket_price int check (base_ticket_price > 0) not null,
    match_status varchar(20) check(match_status in ('Available', 'Selling Fast', 'Sold Out', 'Postponed')) not null
    
    
);

--- match data insert
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');


--  booking table create 

CREATE TABLE Bookings (
    booking_id serial primary key,
    user_id int references users(user_id) on delete cascade ,
    match_id int references matches(match_id) on delete cascade,
    seat_number varchar(10),
    payment_status varchar(20) check(payment_status in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost int  check(total_cost > 0) not null
    
   
)

