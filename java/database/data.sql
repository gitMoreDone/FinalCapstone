BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3) VALUES ('Cherry Tomato', 'Solanum lycopersicum var. cerasiforme', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240001/CherryTomatoes_h4vrat_utuehj.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240002/cherrytomatoes2_kkepr9_rozerf.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240003/cherrytomatoes3_wg9dlv_t4y5dw.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Cucumber', 'Cucumis sativus', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239994/ARS_cucumber_fbic0b_vcwe6s.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241112/cucumber2_zpbz5d_lkt1fw.webp', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241099/How-to-Grow-Cucumber_etab9b_lgyplt.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Butternut Squash', 'Cucurbita moschata','Vegetable','https://res.cloudinary.com/dwdijh29x/image/upload/v1733239999/butternut-squash_rsmgjq_ebt2y1.webp', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241108/butternut_d8fldf_yjwzkf.webp', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241101/how-to-grow-winter-squash_hdkavk_dkudfm.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Broccoli', 'Brassica oleracea var. italica', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239998/broc_ayv6re_bnj45n.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Potato', 'Solanum tuberosum', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239988/potatoes_kaphgl_vif44c.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Onion','Allium cepa', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239986/onions_r6xoax_qdkgqs.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Okra', 'Abelmoschus esculentus', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239985/okra_w9z2tx_zgxfoo.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Turnip', 'Brassica rapa subsp. rapa', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239992/turnips_nwnj2v_jdicnp.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Carrot', 'Daucus carota subsp. sativus', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240000/carrots_fzqzxq_hykrze.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Bell Pepper', 'Capsicum', 'Vegetable', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239995/bellpeppers_hjzrya_bthf8y.webp');


INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Basil', 'Ocimum basilicum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239995/Basil_j5v4uu_dbstit.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241106/basil2_bkbamw_sbioci.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241107/Basil3_mhjfz4_k5utte.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Cilantro', 'Coriandrum sativum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240005/Cilantro_c2mzkj_nsqjkg.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241110/Cilantro2_kcz9p5_r2gxba.webp', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241110/cilantro_cu6trq_nddddz.png');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Dill', 'Anethum graveolens', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240006/Dill_biszrw_j0fqzl.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240006/Dill_biszrw_j0fqzl.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241095/dill_yvzatq_hb3and.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Chives', 'Allium schoenoprasum', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733240004/chives_xc4961_lcqclw.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Parsley', 'Petroselinum crispum', 'Herb','https://res.cloudinary.com/dwdijh29x/image/upload/v1733239987/parsley_wy9tso_skcjc2.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Oregano', 'Origanum vulgare', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239986/oreganoplant_kclkkw_pz4d4h.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Sage', 'Salvia officinalis', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239990/sage_mrnyyn_bwvrb3.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Thyme', 'Thymus vulgaris', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239991/thyme_qtwn1n_l97jef.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Mint', 'Mentha', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239984/mint_skev2j_ntsn8c.webp' );
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Lemon Balm', 'Melissa officinalis', 'Herb', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239983/lemonbalm_vc12ac_blrmrn.jpg');



INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Watermelon','Citrullus lanatus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239993/watermelon_lxfxiy_mcmmds.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241104/water1_hkgf6j_grwzri.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241105/water3_gopjsf_o85b4x.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Strawberry', 'Fragaria × ananassa', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239990/strawberry_ysoaao_wugda3.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241102/strawberry1_cmwaiy_elu5i4.webp', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241103/strawberry2_w6rq6j_vvsoev.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1, plant_image_2, plant_image_3)  VALUES ('Blueberry','Vaccinium sect. Cyanococcus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239997/blueberries_hgh8dj_qeg7x3.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241097/do-blueberries_qwm1gj_teks35.jpg', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733241098/Grow-Blueberries_rsv6iz_cvk6jr.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Raspberry', 'Rubus idaeus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239989/raspberry_j0f1rf_evuxnb.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Blackberry', 'Rubus subg. Rubus', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239996/blackberry_xekkwd_saquto.webp');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Cantaloupe', 'Cucumis melo var. cantalupensis', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239999/cantaloupe_kyphss_pnwnxz.jpg');
INSERT INTO plants (plant_name, scientific_name, plant_type, plant_image_1) VALUES ('Figs', 'Ficus carica', 'Fruit', 'https://res.cloudinary.com/dwdijh29x/image/upload/v1733239983/fig_sal82s_r2x1v4.avif');


INSERT INTO garden (plant_id, user_id) VALUES (1, 1);
INSERT INTO garden (plant_id, user_id) VALUES (2, 1);
INSERT INTO garden (plant_id, user_id) VALUES (3, 1);
INSERT INTO garden (plant_id, user_id) VALUES (4, 1);

COMMIT TRANSACTION;
