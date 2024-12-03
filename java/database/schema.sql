BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE plants (
    plant_id SERIAL,
    plant_name varchar(50) NOT NULL,
    scientific_name varchar NOT NULL,
    plant_type varChar(10) NOT NULL,
    plant_zone varchar(8) NULL,
    plant_description text NULL,
    water_level text NULL,
    light_level text NULL,
    plant_care text NULL,
    plant_image_1 text NOT NULL,
    plant_image_2 text NULL,
    plant_image_3 text NULL,
    CONSTRAINT PK_plants PRIMARY KEY (plant_id)
);

CREATE TABLE garden (
    garden_id SERIAL,
    plant_id int NOT NULL,
    user_id int NOT NULL,
    plant_qty int DEFAULT 1 NOT NULL,
    CONSTRAINT FK_plant_id FOREIGN KEY (plant_id) REFERENCES plants(plant_id),
    CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

COMMIT TRANSACTION;
