--  database create
create database bookingsystem
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
