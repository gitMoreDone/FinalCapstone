BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Cherry Tomato', 'Solanum lycopersicum var. cerasiforme', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157032/CherryTomatoes_h4vrat.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Cucumber', 'Cucumis sativus', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733156971/ARS_cucumber_fbic0b.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Butternut Squash', 'Cucurbita moschata','Vegetable','https://res.cloudinary.com/dwdijh29x/image/upload/v1733157485/butternut-squash_rsmgjq.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Broccoli', 'Brassica oleracea var. italica', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174507/broc_ayv6re.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Potato', 'Solanum tuberosum', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174507/potatoes_kaphgl.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Onion','Allium cepa', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174508/onions_r6xoax.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Okra', 'Abelmoschus esculentus', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174507/okra_w9z2tx.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Turnip', 'Brassica rapa subsp. rapa', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174508/turnips_nwnj2v.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Carrot', 'Daucus carota subsp. sativus', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174507/carrots_fzqzxq.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Bell Pepper', 'Capsicum', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174507/bellpeppers_hjzrya.webp');


INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Basil', 'Ocimum basilicum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157484/Basil_j5v4uu.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Cilantro', 'Coriandrum sativum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157485/Cilantro_c2mzkj.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Dill', 'Anethum graveolens', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157590/Dill_biszrw.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Chives', 'Allium schoenoprasum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733175674/chives_xc4961.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Parsley', 'Petroselinum crispum', 'Herb','https://res.cloudinary.com/dwdijh29x/image/upload/v1733175676/parsley_wy9tso.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Oregano', 'Origanum vulgare', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733175675/oreganoplant_kclkkw.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Sage', 'Salvia officinalis', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733175677/sage_mrnyyn.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Thyme', 'Thymus vulgaris', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733175676/thyme_qtwn1n.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Mint', 'Mentha', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733175675/mint_skev2j.webp' );
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Lemon Balm', 'Melissa officinalis', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733175674/lemonbalm_vc12ac.jpg');



INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Watermelon','Citrullus lanatus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157488/watermelon_lxfxiy.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Strawberry', 'Fragaria × ananassa', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157487/strawberry_ysoaao.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Blueberry','Vaccinium sect. Cyanococcus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733157485/blueberries_hgh8dj.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Raspberry', 'Rubus idaeus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174526/raspberry_j0f1rf.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Blackberry', 'Rubus subg. Rubus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174525/blackberry_xekkwd.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Cantaloupe', 'Cucumis melo var. cantalupensis', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174525/cantaloupe_kyphss.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image) VALUES ('Figs', 'Ficus carica', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733174566/fig_sal82s.avif');


INSERT INTO garden (plant_id, user_id) VALUES (1, 1);
INSERT INTO garden (plant_id, user_id) VALUES (2, 1);
INSERT INTO garden (plant_id, user_id) VALUES (3, 1);
INSERT INTO garden (plant_id, user_id) VALUES (4, 1);

COMMIT TRANSACTION;
