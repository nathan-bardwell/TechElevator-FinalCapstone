-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;

CREATE TABLE app_user (
  user_id SERIAL PRIMARY KEY,
  email varchar(100) NOT NULL,
  last_name varchar(32) NOT NUll,
  first_name varchar(32) NOT NULL,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32) NOT NULL,
  salt varchar(255) NOT NULL,
  team_name varchar(100)
);

CREATE TABLE house(
  house_id SERIAL PRIMARY KEY,
  address varchar(120) NOT NULL,
  resident varchar(64) NOT NULL,
  notes varchar(280),
  phone_number varchar(15),
  status varchar(40) DEFAULT 'NV'
  ADD CONSTRAINT check_status CHECK(status = 'NV' 
  OR status = 'O' OR status = 'NI' OR status = 'FU' OR status = 'NS');  
  );
  

 CREATE TABLE team(
  team_id SERIAL,
  admin_id integer PRIMARY KEY,
  
 
 );
  

COMMIT;