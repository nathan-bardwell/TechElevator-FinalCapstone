-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user cascade;
DROP TABLE IF EXISTS house cascade;
DROP TABLE IF EXISTS user_team cascade;
DROP TABLE IF EXISTS team cascade;
DROP TABLE IF EXISTS house_notes cascade;
DROP TABLE IF EXISTS note cascade;

CREATE TABLE app_user (
  user_id SERIAL,
  email varchar(100) NOT NULL,
  last_name varchar(32) NOT NUll,
  first_name varchar(32) NOT NULL,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32) NOT NULL,
  salt varchar(255) NOT NULL,
  CONSTRAINT pk_user_user_id PRIMARY KEY (user_id)
);

CREATE TABLE house(
  house_id SERIAL PRIMARY KEY,
  address varchar(120) NOT NULL,
  resident varchar(64) NOT NULL,
  phone_number varchar(15),
  creator_id varchar(32) NOT NULL,
  assignment_id varchar(32),
  status varchar(40) DEFAULT 'NV',
  CONSTRAINT fk_house_creator_id FOREIGN KEY (creator_id) REFERENCES app_user(user_name),
  CONSTRAINT fk_house_assignment_id FOREIGN KEY (assignment_id) REFERENCES app_user(user_name),
  CONSTRAINT check_status CHECK(status = 'NV' 
  OR status = 'C' OR status = 'NI' OR status = 'FU' OR status = 'NS')  
);
  
CREATE TABLE house_notes(
  house_id integer,
  note_id integer
  CONSTRAINT pk_house_id_note_id PRIMARY KEY (house_id, note_id),
  CONSTRAINT fk_house_id FOREIGN KEY (house_id) REFERENCES house(house_id),
  CONSTRAINT fk_note_id FOREIGN KEY (note_id) REFERENCES note(note_id)
);  
  
CREATE TABLE note(
  note_id SERIAL,
  text varchar(280),
  time timestamp NOT NULL,
  CONSTRAINT pk_note_id PRIMARY KEY (note_id)
);  
  
CREATE TABLE team(
    team_id SERIAL NOT NULL,
    name varchar(64),
    CONSTRAINT pk_team_id PRIMARY KEY (team_id)
);
  
CREATE TABLE user_team(
   user_id integer,
   team_id integer,
   CONSTRAINT pk_user_team_user_id_team_id PRIMARY KEY (user_id, team_id),
   CONSTRAINT fk_user_team_user_id FOREIGN KEY (user_id) REFERENCES app_user(user_id),
   CONSTRAINT fk_user_team_team_id FOREIGN KEY (team_id) REFERENCES team(team_id)
);
  


 
 
  

COMMIT;