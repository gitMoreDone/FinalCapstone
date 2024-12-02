BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Cherry Tomato', 'Solanum lycopersicum var. cerasiforme', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157032/CherryTomatoes_h4vrat.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Cucumber', 'Cucumis sativus', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733156971/ARS_cucumber_fbic0b.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Butternut Squash', 'Cucurbita moschata','Vegetable','https://res.cloudinary.com/dwdijh29x/image/upload/v1733157485/butternut-squash_rsmgjq.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Watermelon','Citrullus lanatus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157488/watermelon_lxfxiy.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Strawberry', 'Fragaria × ananassa', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157487/strawberry_ysoaao.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Blueberry','Vaccinium sect. Cyanococcus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157485/blueberries_hgh8dj.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Basil', 'Ocimum basilicum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157484/Basil_j5v4uu.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Cilantro', 'Coriandrum sativum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157485/Cilantro_c2mzkj.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Dill', 'Anethum graveolens', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157590/Dill_biszrw.jpg');

INSERT INTO garden (plant_id, user_id, plant_qty) VALUES (1, 1, 1);
INSERT INTO garden (plant_id, user_id, plant_qty) VALUES (2, 1, 2);
INSERT INTO garden (plant_id, user_id, plant_qty) VALUES (3, 1, 1);
INSERT INTO garden (plant_id, user_id, plant_qty) VALUES (4, 1, 4);

COMMIT TRANSACTION;
