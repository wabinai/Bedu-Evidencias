###RETO 1
create database if not exists bedu_test_2;
use bedu_test_2;

###SE CREA TABLA MOVIES
create table if not exists movies (
   id int primary key, 
   title varchar(100), 
   generos varchar(100)
);

###SE CREA TABLA RATINGS
create table if not exists ratings (
   userid int, 
   movieid int, 
   rating int, 
   time_stamp bigint
);