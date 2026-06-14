--  database name
create database bookingsystem
--  user table
create table users(
  users_id serial primary key,
  full_name  varchar(50) not null,
  email varchar(100) unique not null,
  phone_number varchar(20),
  role varchar(20) check(role in ('Ticket Manager ','Football Fan')) not null
   
)