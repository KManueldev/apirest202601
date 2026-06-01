drop table laminas_panini_2026;

drop table paises_mundial_2026;

CREATE TABLE paises_mundial_2026 (
    iso3 VARCHAR(3) PRIMARY KEY,
    pais VARCHAR(100) NOT NULL,
    grupo CHAR(1) NOT NULL
);

INSERT INTO paises_mundial_2026 (iso3, pais, grupo) VALUES

-- Grupo A
('MEX', 'Mexico', 'A'),
('RSA', 'South Africa', 'A'),
('KOR', 'South Korea', 'A'),
('CZE', 'Czech Republic', 'A'),

-- Grupo B
('CAN', 'Canada', 'B'),
('BIH', 'Bosnia and Herzegovina', 'B'),
('QAT', 'Qatar', 'B'),
('SUI', 'Switzerland', 'B'),

-- Grupo C
('BRA', 'Brazil', 'C'),
('MAR', 'Morocco', 'C'),
('HAI', 'Haiti', 'C'),
('SCO', 'Scotland', 'C'),

-- Grupo D
('USA', 'United States', 'D'),
('PAR', 'Paraguay', 'D'),
('AUS', 'Australia', 'D'),
('TUR', 'Turkey', 'D'),

-- Grupo E
('GER', 'Germany', 'E'),
('CUW', 'Curacao', 'E'),
('CIV', 'Ivory Coast', 'E'),
('ECU', 'Ecuador', 'E'),

-- Grupo F
('NED', 'Netherlands', 'F'),
('JPN', 'Japan', 'F'),
('SWE', 'Sweden', 'F'),
('TUN', 'Tunisia', 'F'),

-- Grupo G
('BEL', 'Belgium', 'G'),
('EGY', 'Egypt', 'G'),
('IRN', 'Iran', 'G'),
('NZL', 'New Zealand', 'G'),

-- Grupo H
('ESP', 'Spain', 'H'),
('CPV', 'Cape Verde', 'H'),
('KSA', 'Saudi Arabia', 'H'),
('URU', 'Uruguay', 'H'),

-- Grupo I
('FRA', 'France', 'I'),
('SEN', 'Senegal', 'I'),
('IRQ', 'Iraq', 'I'),
('NOR', 'Norway', 'I'),

-- Grupo J
('ARG', 'Argentina', 'J'),
('ALG', 'Algeria', 'J'),
('AUT', 'Austria', 'J'),
('JOR', 'Jordan', 'J'),

-- Grupo K
('POR', 'Portugal', 'K'),
('COD', 'DR Congo', 'K'),
('UZB', 'Uzbekistan', 'K'),
('COL', 'Colombia', 'K'),

-- Grupo L
('ENG', 'England', 'L'),
('CRO', 'Croatia', 'L'),
('GHA', 'Ghana', 'L'),
('PAN', 'Panama', 'L');


CREATE TABLE laminas_panini_2026 (
    id VARCHAR(10) NOT NULL PRIMARY KEY,            -- COL1 al COL20
    nombre_sticker VARCHAR(100) NOT NULL,  -- Nombre del jugador o elemento
    fecha_nacimiento DATE,
    estatura_cm INT,                       -- En centímetros (ej. 180)
    peso_kg INT,                           -- En kilogramos (ej. 75)
    equipo_actual VARCHAR(100),
    es_especial BOOLEAN DEFAULT FALSE,
    foto_url VARCHAR(255),
    iso3 VARCHAR(3),
    posicion varchar(15)
);

ALTER TABLE laminas_panini_2026
   ADD CONSTRAINT laminas_panini_2026_FK1 FOREIGN KEY (iso3)
     REFERENCES paises_mundial_2026(iso3);

-- Limpiamos la tabla anterior para evitar duplicados si ya habías insertado datos
TRUNCATE TABLE laminas_panini_2026;

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('MEX1', 'Escudo Selección México', NULL, NULL, NULL, 'Selección México', TRUE, 'https://example.com/mexico_escudo.png', 'MEX', 'ESCUDO'),

-- Jugadores
('MEX2', 'Guillermo Ochoa', '1985-07-13', 185, 78, 'Salernitana', TRUE, 'https://example.com/guillermo_ochoa.png', 'MEX', 'Arquero'),

('MEX3', 'Luis Ángel Malagón', '1997-03-02', 180, 74, 'Club América', FALSE, 'https://example.com/malagon.png', 'MEX', 'Arquero'),

('MEX4', 'Jorge Sánchez', '1997-12-10', 175, 70, 'Porto', FALSE, 'https://example.com/jorge_sanchez.png', 'MEX', 'Defensa'),

('MEX5', 'Johan Vásquez', '1998-10-22', 185, 78, 'Genoa', FALSE, 'https://example.com/johan_vasquez.png', 'MEX', 'Defensa'),

('MEX6', 'César Montes', '1997-02-24', 191, 84, 'Almería', FALSE, 'https://example.com/cesar_montes.png', 'MEX', 'Defensa'),

('MEX7', 'Jesús Gallardo', '1994-08-15', 176, 74, 'Monterrey', FALSE, 'https://example.com/jesus_gallardo.png', 'MEX', 'Defensa'),

('MEX8', 'Edson Álvarez', '1997-10-24', 187, 73, 'West Ham United', TRUE, 'https://example.com/edson_alvarez.png', 'MEX', 'Volante'),

('MEX9', 'Luis Chávez', '1996-01-15', 178, 73, 'Dynamo Moscow', FALSE, 'https://example.com/luis_chavez.png', 'MEX', 'Volante'),

('MEX10', 'Orbelín Pineda', '1996-03-24', 169, 64, 'AEK Atenas', FALSE, 'https://example.com/orbelin_pineda.png', 'MEX', 'Volante'),

('MEX11', 'Hirving Lozano', '1995-07-30', 175, 70, 'PSV Eindhoven', TRUE, 'https://example.com/hirving_lozano.png', 'MEX', 'Extremo'),

('MEX12', 'Santiago Giménez', '2001-04-18', 182, 78, 'Feyenoord', TRUE, 'https://example.com/santiago_gimenez.png', 'MEX', 'Delantero'),

-- Foto del equipo
('MEX13', 'Selección México 2026', NULL, NULL, NULL, 'Selección México', TRUE, 'https://example.com/seleccion_mexico_2026.png', 'MEX', 'EQUIPO'),

-- Más jugadores
('MEX14', 'Raúl Jiménez', '1991-05-05', 190, 81, 'Fulham', FALSE, 'https://example.com/raul_jimenez.png', 'MEX', 'Delantero'),

('MEX15', 'Henry Martín', '1992-11-18', 178, 74, 'Club América', FALSE, 'https://example.com/henry_martin.png', 'MEX', 'Delantero'),

('MEX16', 'Carlos Rodríguez', '1997-01-03', 171, 65, 'Cruz Azul', FALSE, 'https://example.com/carlos_rodriguez.png', 'MEX', 'Volante'),

('MEX17', 'Erick Sánchez', '1999-09-27', 167, 64, 'Pachuca', FALSE, 'https://example.com/erick_sanchez.png', 'MEX', 'Volante'),

('MEX18', 'Kevin Álvarez', '1999-01-15', 176, 70, 'Club América', FALSE, 'https://example.com/kevin_alvarez.png', 'MEX', 'Defensa'),

('MEX19', 'Julián Araujo', '2001-08-13', 180, 73, 'Las Palmas', FALSE, 'https://example.com/julian_araujo.png', 'MEX', 'Defensa'),

('MEX20', 'Uriel Antuna', '1997-08-21', 174, 68, 'Cruz Azul', FALSE, 'https://example.com/antuna.png', 'MEX', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'MEX'
WHERE id like 'MEX%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('RSA1', 'Escudo Selección Sudáfrica', NULL, NULL, NULL, 'Selección Sudáfrica', TRUE, 'https://example.com/sudafrica_escudo.png', 'RSA', 'ESCUDO'),

-- Jugadores
('RSA2', 'Ronwen Williams', '1992-01-21', 184, 78, 'Mamelodi Sundowns', TRUE, 'https://example.com/ronwen_williams.png', 'RSA', 'Arquero'),

('RSA3', 'Veli Mothwa', '1991-02-12', 181, 76, 'AmaZulu FC', FALSE, 'https://example.com/veli_mothwa.png', 'RSA', 'Arquero'),

('RSA4', 'Khuliso Mudau', '1995-04-26', 181, 72, 'Mamelodi Sundowns', FALSE, 'https://example.com/khuliso_mudau.png', 'RSA', 'Defensa'),

('RSA5', 'Mothobi Mvala', '1994-06-14', 186, 80, 'Mamelodi Sundowns', FALSE, 'https://example.com/mothobi_mvala.png', 'RSA', 'Defensa'),

('RSA6', 'Siyanda Xulu', '1991-12-30', 189, 82, 'SuperSport United', FALSE, 'https://example.com/siyanda_xulu.png', 'RSA', 'Defensa'),

('RSA7', 'Aubrey Modiba', '1995-07-22', 172, 68, 'Mamelodi Sundowns', FALSE, 'https://example.com/aubrey_modiba.png', 'RSA', 'Defensa'),

('RSA8', 'Teboho Mokoena', '1997-01-24', 176, 71, 'Mamelodi Sundowns', TRUE, 'https://example.com/teboho_mokoena.png', 'RSA', 'Volante'),

('RSA9', 'Sphephelo Sithole', '1999-03-03', 178, 73, 'Tondela', FALSE, 'https://example.com/sphephelo_sithole.png', 'RSA', 'Volante'),

('RSA10', 'Jayden Adams', '2001-05-05', 175, 69, 'Stellenbosch FC', FALSE, 'https://example.com/jayden_adams.png', 'RSA', 'Volante'),

('RSA11', 'Themba Zwane', '1989-08-03', 170, 67, 'Mamelodi Sundowns', TRUE, 'https://example.com/themba_zwane.png', 'RSA', 'Mediapunta'),

('RSA12', 'Percy Tau', '1994-05-13', 170, 65, 'Al Ahly', TRUE, 'https://example.com/percy_tau.png', 'RSA', 'Delantero'),

-- Foto del equipo
('RSA13', 'Selección Sudáfrica 2026', NULL, NULL, NULL, 'Selección Sudáfrica', TRUE, 'https://example.com/seleccion_sudafrica_2026.png', 'RSA', 'EQUIPO'),

-- Más jugadores
('RSA14', 'Zakhele Lepasa', '1997-03-19', 180, 74, 'Orlando Pirates', FALSE, 'https://example.com/zakhele_lepasa.png', 'RSA', 'Delantero'),

('RSA15', 'Evidence Makgopa', '2000-06-05', 188, 79, 'Orlando Pirates', FALSE, 'https://example.com/evidence_makgopa.png', 'RSA', 'Delantero'),

('RSA16', 'Bathusi Aubaas', '1995-05-14', 175, 70, 'TS Galaxy', FALSE, 'https://example.com/bathusi_aubaas.png', 'RSA', 'Volante'),

('RSA17', 'Oswin Appollis', '2001-08-25', 172, 68, 'Polokwane City', FALSE, 'https://example.com/oswin_appollis.png', 'RSA', 'Extremo'),

('RSA18', 'Grant Kekana', '1992-10-31', 180, 77, 'Mamelodi Sundowns', FALSE, 'https://example.com/grant_kekana.png', 'RSA', 'Defensa'),

('RSA19', 'Terrence Mashego', '1996-06-28', 173, 69, 'Mamelodi Sundowns', FALSE, 'https://example.com/terrence_mashego.png', 'RSA', 'Defensa'),

('RSA20', 'Mihlali Mayambela', '1996-08-25', 170, 66, 'Aris Limassol', FALSE, 'https://example.com/mihlali_mayambela.png', 'RSA', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'RSA'
WHERE id like 'RSA%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('KOR1', 'Escudo Selección Corea del Sur', NULL, NULL, NULL, 'Selección Corea del Sur', TRUE, 'https://example.com/corea_sur_escudo.png', 'KOR', 'ESCUDO'),

-- Jugadores
('KOR2', 'Kim Seung-gyu', '1990-09-30', 187, 84, 'Al Shabab', FALSE, 'https://example.com/kim_seung_gyu.png', 'KOR', 'Arquero'),

('KOR3', 'Jo Hyeon-woo', '1991-09-25', 189, 75, 'Ulsan Hyundai', FALSE, 'https://example.com/jo_hyeon_woo.png', 'KOR', 'Arquero'),

('KOR4', 'Kim Min-jae', '1996-11-15', 190, 86, 'Bayern Munich', TRUE, 'https://example.com/kim_min_jae.png', 'KOR', 'Defensa'),

('KOR5', 'Kim Young-gwon', '1990-02-27', 186, 83, 'Ulsan Hyundai', FALSE, 'https://example.com/kim_young_gwon.png', 'KOR', 'Defensa'),

('KOR6', 'Seol Young-woo', '1998-12-05', 183, 72, 'Ulsan Hyundai', FALSE, 'https://example.com/seol_young_woo.png', 'KOR', 'Defensa'),

('KOR7', 'Lee Ki-je', '1991-07-09', 176, 68, 'Suwon Samsung Bluewings', FALSE, 'https://example.com/lee_ki_je.png', 'KOR', 'Defensa'),

('KOR8', 'Hwang In-beom', '1996-09-20', 177, 70, 'FK Crvena Zvezda', FALSE, 'https://example.com/hwang_in_beom.png', 'KOR', 'Volante'),

('KOR9', 'Lee Jae-sung', '1992-08-10', 180, 70, 'Mainz 05', FALSE, 'https://example.com/lee_jae_sung.png', 'KOR', 'Volante'),

('KOR10', 'Jung Woo-young', '1999-09-20', 179, 68, 'VfB Stuttgart', FALSE, 'https://example.com/jung_woo_young.png', 'KOR', 'Volante'),

('KOR11', 'Lee Kang-in', '2001-02-19', 173, 68, 'Paris Saint-Germain', TRUE, 'https://example.com/lee_kang_in.png', 'KOR', 'Extremo'),

('KOR12', 'Son Heung-min', '1992-07-08', 183, 78, 'Tottenham Hotspur', TRUE, 'https://example.com/son_heung_min.png', 'KOR', 'Delantero'),

-- Foto del equipo
('KOR13', 'Selección Corea del Sur 2026', NULL, NULL, NULL, 'Selección Corea del Sur', TRUE, 'https://example.com/seleccion_corea_sur_2026.png', 'KOR', 'EQUIPO'),

-- Más jugadores
('KOR14', 'Hwang Hee-chan', '1996-01-26', 177, 77, 'Wolverhampton Wanderers', TRUE, 'https://example.com/hwang_hee_chan.png', 'KOR', 'Delantero'),

('KOR15', 'Cho Gue-sung', '1998-01-25', 189, 82, 'Midtjylland', FALSE, 'https://example.com/cho_gue_sung.png', 'KOR', 'Delantero'),

('KOR16', 'Park Yong-woo', '1993-09-10', 186, 78, 'Al Ain', FALSE, 'https://example.com/park_yong_woo.png', 'KOR', 'Volante'),

('KOR17', 'Hong Hyun-seok', '1999-06-16', 177, 69, 'KAA Gent', FALSE, 'https://example.com/hong_hyun_seok.png', 'KOR', 'Volante'),

('KOR18', 'Kim Jin-su', '1992-06-13', 177, 70, 'Jeonbuk Hyundai Motors', FALSE, 'https://example.com/kim_jin_su.png', 'KOR', 'Defensa'),

('KOR19', 'Jeong Seung-hyun', '1994-04-03', 188, 82, 'Ulsan Hyundai', FALSE, 'https://example.com/jeong_seung_hyun.png', 'KOR', 'Defensa'),

('KOR20', 'Yang Hyun-jun', '2002-05-25', 179, 71, 'Celtic', FALSE, 'https://example.com/yang_hyun_jun.png', 'KOR', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'KOR'
WHERE id like 'KOR%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('CZE1', 'Escudo Selección República Checa', NULL, NULL, NULL, 'Selección República Checa', TRUE, 'https://example.com/republica_checa_escudo.png', 'CZE', 'ESCUDO'),

-- Jugadores
('CZE2', 'Jindřich Staněk', '1996-04-27', 191, 85, 'Slavia Praga', FALSE, 'https://example.com/jindrich_stanek.png', 'CZE', 'Arquero'),

('CZE3', 'Tomáš Vaclík', '1989-03-29', 188, 85, 'Albacete', FALSE, 'https://example.com/tomas_vaclik.png', 'CZE', 'Arquero'),

('CZE4', 'Vladimír Coufal', '1992-08-22', 174, 70, 'West Ham United', FALSE, 'https://example.com/vladimir_coufal.png', 'CZE', 'Defensa'),

('CZE5', 'Tomáš Holeš', '1993-03-31', 180, 73, 'Slavia Praga', FALSE, 'https://example.com/tomas_holes.png', 'CZE', 'Defensa'),

('CZE6', 'Ladislav Krejčí', '1999-04-20', 191, 83, 'Sparta Praga', TRUE, 'https://example.com/ladislav_krejci.png', 'CZE', 'Defensa'),

('CZE7', 'David Jurásek', '2000-08-07', 183, 76, 'Benfica', FALSE, 'https://example.com/david_jurasek.png', 'CZE', 'Defensa'),

('CZE8', 'Tomáš Souček', '1995-02-27', 192, 86, 'West Ham United', TRUE, 'https://example.com/tomas_soucek.png', 'CZE', 'Volante'),

('CZE9', 'Antonín Barák', '1994-12-03', 190, 86, 'Fiorentina', FALSE, 'https://example.com/antonin_barak.png', 'CZE', 'Volante'),

('CZE10', 'Alex Král', '1998-05-19', 186, 80, 'Union Berlin', FALSE, 'https://example.com/alex_kral.png', 'CZE', 'Volante'),

('CZE11', 'Václav Černý', '1997-10-17', 182, 74, 'VfL Wolfsburg', FALSE, 'https://example.com/vaclav_cerny.png', 'CZE', 'Extremo'),

('CZE12', 'Patrik Schick', '1996-01-24', 191, 87, 'Bayer Leverkusen', TRUE, 'https://example.com/patrik_schick.png', 'CZE', 'Delantero'),

-- Foto del equipo
('CZE13', 'Selección República Checa 2026', NULL, NULL, NULL, 'Selección República Checa', TRUE, 'https://example.com/seleccion_republica_checa_2026.png', 'CZE', 'EQUIPO'),

-- Más jugadores
('CZE14', 'Adam Hložek', '2002-07-25', 188, 82, 'Bayer Leverkusen', TRUE, 'https://example.com/adam_hlozek.png', 'CZE', 'Delantero'),

('CZE15', 'Mojmír Chytil', '1999-04-29', 186, 79, 'Slavia Praga', FALSE, 'https://example.com/mojmir_chytil.png', 'CZE', 'Delantero'),

('CZE16', 'Pavel Šulc', '2000-12-29', 177, 71, 'Viktoria Plzeň', FALSE, 'https://example.com/pavel_sulc.png', 'CZE', 'Volante'),

('CZE17', 'Lukáš Provod', '1996-10-23', 189, 80, 'Slavia Praga', FALSE, 'https://example.com/lukas_provod.png', 'CZE', 'Volante'),

('CZE18', 'David Zima', '2000-11-08', 190, 84, 'Torino', FALSE, 'https://example.com/david_zima.png', 'CZE', 'Defensa'),

('CZE19', 'Jakub Brabec', '1992-08-06', 184, 78, 'Aris Salónica', FALSE, 'https://example.com/jakub_brabec.png', 'CZE', 'Defensa'),

('CZE20', 'Jan Kuchta', '1997-01-08', 184, 79, 'Sparta Praga', FALSE, 'https://example.com/jan_kuchta.png', 'CZE', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'CZE'
WHERE id like 'CZE%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('CAN1', 'Escudo Selección Canadá', NULL, NULL, NULL, 'Selección Canadá', TRUE, 'https://example.com/canada_escudo.png', 'CAN', 'ESCUDO'),

-- Jugadores
('CAN2', 'Milan Borjan', '1987-10-23', 195, 88, 'Slovan Bratislava', FALSE, 'https://example.com/milan_borjan.png', 'CAN', 'Arquero'),

('CAN3', 'Dayne St. Clair', '1997-05-09', 190, 80, 'Minnesota United', FALSE, 'https://example.com/dayne_st_clair.png', 'CAN', 'Arquero'),

('CAN4', 'Alistair Johnston', '1998-10-08', 180, 77, 'Celtic', FALSE, 'https://example.com/alistair_johnston.png', 'CAN', 'Defensa'),

('CAN5', 'Moïse Bombito', '2000-03-30', 190, 82, 'Colorado Rapids', FALSE, 'https://example.com/moise_bombito.png', 'CAN', 'Defensa'),

('CAN6', 'Derek Cornelius', '1997-11-25', 188, 84, 'Malmö FF', FALSE, 'https://example.com/derek_cornelius.png', 'CAN', 'Defensa'),

('CAN7', 'Alphonso Davies', '2000-11-02', 183, 75, 'Bayern Munich', TRUE, 'https://example.com/alphonso_davies.png', 'CAN', 'Defensa'),

('CAN8', 'Stephen Eustáquio', '1996-12-21', 178, 72, 'Porto', TRUE, 'https://example.com/stephen_eustaquio.png', 'CAN', 'Volante'),

('CAN9', 'Ismaël Koné', '2002-06-16', 188, 76, 'Watford', FALSE, 'https://example.com/ismael_kone.png', 'CAN', 'Volante'),

('CAN10', 'Jonathan Osorio', '1992-06-12', 175, 72, 'Toronto FC', FALSE, 'https://example.com/jonathan_osorio.png', 'CAN', 'Volante'),

('CAN11', 'Tajon Buchanan', '1999-02-08', 183, 78, 'Inter de Milán', TRUE, 'https://example.com/tajon_buchanan.png', 'CAN', 'Extremo'),

('CAN12', 'Jonathan David', '2000-01-14', 180, 77, 'Lille', TRUE, 'https://example.com/jonathan_david.png', 'CAN', 'Delantero'),

-- Foto del equipo
('CAN13', 'Selección Canadá 2026', NULL, NULL, NULL, 'Selección Canadá', TRUE, 'https://example.com/seleccion_canada_2026.png', 'CAN', 'EQUIPO'),

-- Más jugadores
('CAN14', 'Cyle Larin', '1995-04-17', 188, 85, 'Mallorca', FALSE, 'https://example.com/cyle_larin.png', 'CAN', 'Delantero'),

('CAN15', 'Lucas Cavallini', '1992-12-28', 181, 81, 'Club Tijuana', FALSE, 'https://example.com/lucas_cavallini.png', 'CAN', 'Delantero'),

('CAN16', 'Atiba Hutchinson', '1983-02-08', 187, 79, 'Retirado', TRUE, 'https://example.com/atiba_hutchinson.png', 'CAN', 'Volante'),

('CAN17', 'Richie Laryea', '1995-01-07', 175, 70, 'Toronto FC', FALSE, 'https://example.com/richie_laryea.png', 'CAN', 'Defensa'),

('CAN18', 'Kamal Miller', '1997-05-16', 183, 79, 'Portland Timbers', FALSE, 'https://example.com/kamal_miller.png', 'CAN', 'Defensa'),

('CAN19', 'Sam Adekugbe', '1995-01-16', 176, 73, 'Vancouver Whitecaps', FALSE, 'https://example.com/sam_adekugbe.png', 'CAN', 'Defensa'),

('CAN20', 'Liam Millar', '1999-09-27', 180, 74, 'Preston North End', FALSE, 'https://example.com/liam_millar.png', 'CAN', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'CAN'
WHERE id like 'CAN%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('BIH1', 'Escudo Selección Bosnia y Herzegovina', NULL, NULL, NULL, 'Selección Bosnia y Herzegovina', TRUE, 'https://example.com/bosnia_escudo.png', 'BIH', 'ESCUDO'),

-- Jugadores
('BIH2', 'Ibrahim Šehić', '1988-09-02', 190, 85, 'Konyaspor', FALSE, 'https://example.com/ibrahim_sehic.png', 'BIH', 'Arquero'),

('BIH3', 'Nikola Vasilj', '1995-12-02', 193, 88, 'FC St. Pauli', FALSE, 'https://example.com/nikola_vasilj.png', 'BIH', 'Arquero'),

('BIH4', 'Amar Dedić', '2002-08-18', 180, 72, 'RB Salzburg', TRUE, 'https://example.com/amar_dedic.png', 'BIH', 'Defensa'),

('BIH5', 'Anel Ahmedhodžić', '1999-03-26', 192, 84, 'Sheffield United', TRUE, 'https://example.com/anel_ahmedhodzic.png', 'BIH', 'Defensa'),

('BIH6', 'Dennis Hadžikadunić', '1998-07-09', 191, 83, 'Hamburger SV', FALSE, 'https://example.com/dennis_hadzikadunic.png', 'BIH', 'Defensa'),

('BIH7', 'Sead Kolašinac', '1993-06-20', 183, 82, 'Atalanta', TRUE, 'https://example.com/sead_kolasinac.png', 'BIH', 'Defensa'),

('BIH8', 'Benjamin Tahirović', '2003-03-03', 191, 80, 'Ajax', FALSE, 'https://example.com/benjamin_tahirovic.png', 'BIH', 'Volante'),

('BIH9', 'Amir Hadžiahmetović', '1997-03-08', 179, 73, 'Beşiktaş', FALSE, 'https://example.com/amir_hadziahmetovic.png', 'BIH', 'Volante'),

('BIH10', 'Rade Krunić', '1993-10-07', 184, 74, 'Fenerbahçe', FALSE, 'https://example.com/rade_krunic.png', 'BIH', 'Volante'),

('BIH11', 'Luka Menalo', '1996-07-22', 181, 75, 'Dinamo Zagreb', FALSE, 'https://example.com/luka_menalo.png', 'BIH', 'Extremo'),

('BIH12', 'Edin Džeko', '1986-03-17', 193, 84, 'Fenerbahçe', TRUE, 'https://example.com/edin_dzeko.png', 'BIH', 'Delantero'),

-- Foto del equipo
('BIH13', 'Selección Bosnia y Herzegovina 2026', NULL, NULL, NULL, 'Selección Bosnia y Herzegovina', TRUE, 'https://example.com/seleccion_bosnia_2026.png', 'BIH', 'EQUIPO'),

-- Más jugadores
('BIH14', 'Ermedin Demirović', '1998-03-25', 185, 79, 'FC Augsburg', TRUE, 'https://example.com/ermedin_demirovic.png', 'BIH', 'Delantero'),

('BIH15', 'Smail Prevljak', '1995-05-10', 187, 80, 'Hertha Berlin', FALSE, 'https://example.com/smail_prevljak.png', 'BIH', 'Delantero'),

('BIH16', 'Haris Hajradinović', '1994-02-18', 178, 71, 'Kasımpaşa', FALSE, 'https://example.com/haris_hajradinovic.png', 'BIH', 'Volante'),

('BIH17', 'Gojko Cimirot', '1992-12-19', 178, 72, 'Al Fayha', FALSE, 'https://example.com/gojko_cimirot.png', 'BIH', 'Volante'),

('BIH18', 'Adrian Leon Barišić', '2001-07-19', 191, 82, 'Basel', FALSE, 'https://example.com/adrian_barisic.png', 'BIH', 'Defensa'),

('BIH19', 'Jusuf Gazibegović', '2000-03-11', 175, 69, 'Sturm Graz', FALSE, 'https://example.com/jusuf_gazibegovic.png', 'BIH', 'Defensa'),

('BIH20', 'Miroslav Stevanović', '1990-07-29', 180, 74, 'Servette', FALSE, 'https://example.com/miroslav_stevanovic.png', 'BIH', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'BIH'
WHERE id like 'BIH%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('QAT1', 'Escudo Selección Qatar', NULL, NULL, NULL, 'Selección Qatar', TRUE, 'https://example.com/qatar_escudo.png', 'QAT', 'ESCUDO'),

-- Jugadores
('QAT2', 'Saad Al Sheeb', '1990-02-19', 183, 78, 'Al Sadd', FALSE, 'https://example.com/saad_al_sheeb.png', 'QAT', 'Arquero'),

('QAT3', 'Meshaal Barsham', '1998-02-14', 188, 80, 'Al Sadd', FALSE, 'https://example.com/meshaal_barsham.png', 'QAT', 'Arquero'),

('QAT4', 'Pedro Miguel', '1993-04-04', 185, 79, 'Al Sadd', TRUE, 'https://example.com/pedro_miguel.png', 'QAT', 'Defensa'),

('QAT5', 'Bassam Al-Rawi', '1997-12-16', 180, 75, 'Al Duhail', FALSE, 'https://example.com/bassam_al_rawi.png', 'QAT', 'Defensa'),

('QAT6', 'Tarek Salman', '1997-12-05', 177, 72, 'Al Sadd', FALSE, 'https://example.com/tarek_salman.png', 'QAT', 'Defensa'),

('QAT7', 'Boualem Khoukhi', '1990-07-09', 185, 78, 'Al Sadd', TRUE, 'https://example.com/boualem_khoukhi.png', 'QAT', 'Defensa'),

('QAT8', 'Karim Boudiaf', '1990-09-16', 185, 77, 'Al Duhail', TRUE, 'https://example.com/karim_boudiaf.png', 'QAT', 'Volante'),

('QAT9', 'Abdelkarim Hassan', '1993-08-28', 188, 80, 'Al Sadd', TRUE, 'https://example.com/abdelkarim_hassan.png', 'QAT', 'Defensa'),

('QAT10', 'Assim Madibo', '1996-10-22', 175, 70, 'Al Duhail', FALSE, 'https://example.com/assim_madibo.png', 'QAT', 'Volante'),

('QAT11', 'Akram Afif', '1996-11-18', 177, 69, 'Al Sadd', TRUE, 'https://example.com/akram_afif.png', 'QAT', 'Delantero'),

('QAT12', 'Almoez Ali', '1996-08-19', 178, 70, 'Al Duhail', TRUE, 'https://example.com/almoez_ali.png', 'QAT', 'Delantero'),

-- Foto del equipo
('QAT13', 'Selección Qatar 2026', NULL, NULL, NULL, 'Selección Qatar', TRUE, 'https://example.com/seleccion_qatar_2026.png', 'QAT', 'EQUIPO'),

-- Más jugadores
('QAT14', 'Hassan Al Haydos', '1990-12-11', 170, 68, 'Al Sadd', TRUE, 'https://example.com/hassan_al_haydos.png', 'QAT', 'Extremo'),

('QAT15', 'Mohammed Muntari', '1993-12-20', 184, 78, 'Al Duhail', FALSE, 'https://example.com/mohammed_muntari.png', 'QAT', 'Delantero'),

('QAT16', 'Ahmed Fathy', '1994-11-25', 178, 72, 'Al Wakrah', FALSE, 'https://example.com/ahmed_fathy.png', 'QAT', 'Volante'),

('QAT17', 'Sultan Al Brake', '1996-04-07', 175, 70, 'Al Sadd', FALSE, 'https://example.com/sultan_al_brake.png', 'QAT', 'Defensa'),

('QAT18', 'Homam Ahmed', '1999-08-25', 178, 73, 'Al Gharafa', FALSE, 'https://example.com/homam_ahmed.png', 'QAT', 'Defensa'),

('QAT19', 'Pedro Correia', '1990-07-03', 182, 76, 'Al Arabi', FALSE, 'https://example.com/pedro_correia.png', 'QAT', 'Defensa'),

('QAT20', 'Yusuf Abdurisag', '1999-08-06', 177, 71, 'Al Sadd', FALSE, 'https://example.com/yusuf_abdurisag.png', 'QAT', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'QAT'
WHERE id like 'QAT%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('SUI1', 'Escudo Selección Suiza', NULL, NULL, NULL, 'Selección Suiza', TRUE, 'https://example.com/suiza_escudo.png', 'SUI', 'ESCUDO'),

-- Jugadores
('SUI2', 'Yann Sommer', '1988-12-17', 183, 79, 'Inter de Milán', TRUE, 'https://example.com/yann_sommer.png', 'SUI', 'Arquero'),

('SUI3', 'Gregor Kobel', '1997-12-06', 196, 88, 'Borussia Dortmund', FALSE, 'https://example.com/gregor_kobel.png', 'SUI', 'Arquero'),

('SUI4', 'Manuel Akanji', '1995-07-19', 188, 91, 'Manchester City', TRUE, 'https://example.com/manuel_akanji.png', 'SUI', 'Defensa'),

('SUI5', 'Nico Elvedi', '1996-09-30', 189, 84, 'Borussia Mönchengladbach', FALSE, 'https://example.com/nico_elvedi.png', 'SUI', 'Defensa'),

('SUI6', 'Ricardo Rodríguez', '1992-08-25', 180, 77, 'Torino', FALSE, 'https://example.com/ricardo_rodriguez.png', 'SUI', 'Defensa'),

('SUI7', 'Silvan Widmer', '1993-03-05', 182, 79, 'Mainz 05', FALSE, 'https://example.com/silvan_widmer.png', 'SUI', 'Defensa'),

('SUI8', 'Granit Xhaka', '1992-09-27', 186, 80, 'Bayer Leverkusen', TRUE, 'https://example.com/granit_xhaka.png', 'SUI', 'Volante'),

('SUI9', 'Remo Freuler', '1992-04-15', 181, 78, 'Bologna', FALSE, 'https://example.com/remo_freuler.png', 'SUI', 'Volante'),

('SUI10', 'Denis Zakaria', '1996-11-20', 191, 82, 'Monaco', FALSE, 'https://example.com/denis_zakaria.png', 'SUI', 'Volante'),

('SUI11', 'Xherdan Shaqiri', '1991-10-10', 169, 72, 'Chicago Fire', TRUE, 'https://example.com/xherdan_shaqiri.png', 'SUI', 'Extremo'),

('SUI12', 'Breel Embolo', '1997-02-14', 187, 85, 'Monaco', TRUE, 'https://example.com/breel_embolo.png', 'SUI', 'Delantero'),

-- Foto del equipo
('SUI13', 'Selección Suiza 2026', NULL, NULL, NULL, 'Selección Suiza', TRUE, 'https://example.com/seleccion_suiza_2026.png', 'SUI', 'EQUIPO'),

-- Más jugadores
('SUI14', 'Haris Seferović', '1992-02-22', 189, 85, 'Al Wasl', FALSE, 'https://example.com/haris_seferovic.png', 'SUI', 'Delantero'),

('SUI15', 'Noah Okafor', '2000-05-24', 185, 78, 'AC Milan', TRUE, 'https://example.com/noah_okafor.png', 'SUI', 'Delantero'),

('SUI16', 'Fabian Frei', '1989-01-08', 183, 79, 'Basel', FALSE, 'https://example.com/fabian_frei.png', 'SUI', 'Volante'),

('SUI17', 'Djibril Sow', '1997-02-06', 184, 80, 'Sevilla', FALSE, 'https://example.com/djibril_sow.png', 'SUI', 'Volante'),

('SUI18', 'Eray Cömert', '1998-02-04', 183, 79, 'Valencia', FALSE, 'https://example.com/eray_comert.png', 'SUI', 'Defensa'),

('SUI19', 'Jordan Lotomba', '1998-09-29', 177, 72, 'Niza', FALSE, 'https://example.com/jordan_lotomba.png', 'SUI', 'Defensa'),

('SUI20', 'Dan Ndoye', '2000-10-25', 183, 75, 'Bologna', FALSE, 'https://example.com/dan_ndoye.png', 'SUI', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'SUI'
WHERE id like 'SUI%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('BRA1', 'Escudo Selección Brasil', NULL, NULL, NULL, 'Selección Brasil', TRUE, 'https://example.com/brasil_escudo.png', 'BRA', 'ESCUDO'),

-- Jugadores
('BRA2', 'Alisson Becker', '1992-10-02', 193, 91, 'Liverpool', TRUE, 'https://example.com/alisson.png', 'BRA', 'Arquero'),

('BRA3', 'Ederson Moraes', '1993-08-17', 188, 86, 'Manchester City', FALSE, 'https://example.com/ederson.png', 'BRA', 'Arquero'),

('BRA4', 'Marquinhos', '1994-05-14', 183, 75, 'Paris Saint-Germain', TRUE, 'https://example.com/marquinhos.png', 'BRA', 'Defensa'),

('BRA5', 'Éder Militão', '1998-01-18', 186, 78, 'Real Madrid', TRUE, 'https://example.com/eder_militao.png', 'BRA', 'Defensa'),

('BRA6', 'Gabriel Magalhães', '1997-12-19', 190, 86, 'Arsenal', FALSE, 'https://example.com/gabriel_magalhaes.png', 'BRA', 'Defensa'),

('BRA7', 'Danilo', '1991-07-15', 184, 78, 'Juventus', FALSE, 'https://example.com/danilo.png', 'BRA', 'Defensa'),

('BRA8', 'Casemiro', '1992-02-23', 185, 84, 'Manchester United', TRUE, 'https://example.com/casemiro.png', 'BRA', 'Volante'),

('BRA9', 'Bruno Guimarães', '1997-11-16', 182, 74, 'Newcastle United', TRUE, 'https://example.com/bruno_guimaraes.png', 'BRA', 'Volante'),

('BRA10', 'Lucas Paquetá', '1997-08-27', 180, 72, 'West Ham United', TRUE, 'https://example.com/lucas_paqueta.png', 'BRA', 'Volante'),

('BRA11', 'Vinícius Júnior', '2000-07-12', 176, 73, 'Real Madrid', TRUE, 'https://example.com/vinicius_junior.png', 'BRA', 'Extremo'),

('BRA12', 'Neymar Jr', '1992-02-05', 175, 68, 'Al Hilal', TRUE, 'https://example.com/neymar.png', 'BRA', 'Delantero'),

-- Foto del equipo
('BRA13', 'Selección Brasil 2026', NULL, NULL, NULL, 'Selección Brasil', TRUE, 'https://example.com/seleccion_brasil_2026.png', 'BRA', 'EQUIPO'),

-- Más jugadores
('BRA14', 'Rodrygo Goes', '2001-01-09', 174, 64, 'Real Madrid', TRUE, 'https://example.com/rodrygo.png', 'BRA', 'Delantero'),

('BRA15', 'Richarlison', '1997-05-10', 184, 83, 'Tottenham Hotspur', FALSE, 'https://example.com/richarlison.png', 'BRA', 'Delantero'),

('BRA16', 'Raphinha', '1996-12-14', 176, 68, 'Barcelona', TRUE, 'https://example.com/raphinha.png', 'BRA', 'Extremo'),

('BRA17', 'Evanilson', '1999-10-06', 183, 78, 'Porto', FALSE, 'https://example.com/evanilson.png', 'BRA', 'Delantero'),

('BRA18', 'Militão', '1998-01-18', 186, 78, 'Real Madrid', TRUE, 'https://example.com/militao2.png', 'BRA', 'Defensa'),

('BRA19', 'Alex Sandro', '1991-01-26', 180, 80, 'Juventus', FALSE, 'https://example.com/alex_sandro.png', 'BRA', 'Defensa'),

('BRA20', 'Endrick', '2006-07-21', 173, 72, 'Real Madrid', TRUE, 'https://example.com/endrick.png', 'BRA', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'BRA'
WHERE id like 'BRA%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('MAR1', 'Escudo Selección Marruecos', NULL, NULL, NULL, 'Selección Marruecos', TRUE, 'https://example.com/marruecos_escudo.png', 'MAR', 'ESCUDO'),

-- Jugadores
('MAR2', 'Yassine Bounou', '1991-04-05', 192, 78, 'Al Hilal', TRUE, 'https://example.com/yassine_bounou.png', 'MAR', 'Arquero'),

('MAR3', 'Munir Mohamedi', '1989-05-10', 190, 85, 'RS Berkane', FALSE, 'https://example.com/munir_mohamedi.png', 'MAR', 'Arquero'),

('MAR4', 'Achraf Hakimi', '1998-11-04', 181, 73, 'Paris Saint-Germain', TRUE, 'https://example.com/achraf_hakimi.png', 'MAR', 'Defensa'),

('MAR5', 'Romain Saïss', '1990-03-26', 190, 84, 'Al-Sadd', FALSE, 'https://example.com/romain_saiss.png', 'MAR', 'Defensa'),

('MAR6', 'Nayef Aguerd', '1996-03-30', 190, 76, 'West Ham United', TRUE, 'https://example.com/nayef_aguerd.png', 'MAR', 'Defensa'),

('MAR7', 'Noussair Mazraoui', '1997-11-14', 183, 73, 'Manchester United', TRUE, 'https://example.com/noussair_mazraoui.png', 'MAR', 'Defensa'),

('MAR8', 'Sofyan Amrabat', '1996-08-21', 185, 82, 'Fenerbahçe', TRUE, 'https://example.com/sofyan_amrabat.png', 'MAR', 'Volante'),

('MAR9', 'Azzedine Ounahi', '2000-04-19', 182, 70, 'Olympique de Marseille', TRUE, 'https://example.com/azzedine_ounahi.png', 'MAR', 'Volante'),

('MAR10', 'Bilal El Khannouss', '2004-05-10', 179, 68, 'Leicester City', FALSE, 'https://example.com/bilal_el_khannouss.png', 'MAR', 'Volante'),

('MAR11', 'Hakim Ziyech', '1993-03-19', 181, 70, 'Al Duhail', TRUE, 'https://example.com/hakim_ziyech.png', 'MAR', 'Extremo'),

('MAR12', 'Youssef En-Nesyri', '1997-06-01', 188, 78, 'Sevilla', TRUE, 'https://example.com/youssef_en_nesyri.png', 'MAR', 'Delantero'),

-- Foto del equipo
('MAR13', 'Selección Marruecos 2026', NULL, NULL, NULL, 'Selección Marruecos', TRUE, 'https://example.com/seleccion_marruecos_2026.png', 'MAR', 'EQUIPO'),

-- Más jugadores
('MAR14', 'Sofiane Boufal', '1993-09-17', 175, 70, 'Al-Rayyan', FALSE, 'https://example.com/sofiane_boufal.png', 'MAR', 'Extremo'),

('MAR15', 'Abderrazak Hamdallah', '1990-12-17', 182, 81, 'Al-Ittihad', FALSE, 'https://example.com/abderrazak_hamdallah.png', 'MAR', 'Delantero'),

('MAR16', 'Selim Amallah', '1996-11-15', 185, 78, 'Standard Liège', FALSE, 'https://example.com/selim_amallah.png', 'MAR', 'Volante'),

('MAR17', 'Amine Harit', '1997-06-18', 180, 69, 'Olympique de Marseille', FALSE, 'https://example.com/amine_harit.png', 'MAR', 'Volante'),

('MAR18', 'Jawad El Yamiq', '1992-02-29', 189, 84, 'Al-Wehda', FALSE, 'https://example.com/jawad_el_yamiq.png', 'MAR', 'Defensa'),

('MAR19', 'Badr Benoun', '1993-09-30', 190, 85, 'Qatar SC', FALSE, 'https://example.com/badr_benoun.png', 'MAR', 'Defensa'),

('MAR20', 'Ilias Akhomach', '2004-04-16', 175, 67, 'Villarreal', TRUE, 'https://example.com/ilias_akhomach.png', 'MAR', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'MAR'
WHERE id like 'MAR%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('HAI1', 'Escudo Selección Haití', NULL, NULL, NULL, 'Selección Haití', TRUE, 'https://example.com/haiti_escudo.png', 'HAI', 'ESCUDO'),

-- Jugadores
('HAI2', 'Johnny Placide', '1988-01-29', 189, 85, 'SC Bastia', TRUE, 'https://example.com/johnny_placide.png', 'HAI', 'Arquero'),

('HAI3', 'Johny Desdunes', '1998-05-12', 185, 80, 'FC Metz B', FALSE, 'https://example.com/johny_desdunes.png', 'HAI', 'Arquero'),

('HAI4', 'Andrew Jean-Baptiste', '1992-03-16', 188, 84, 'Orange County SC', FALSE, 'https://example.com/andrew_jean_baptiste.png', 'HAI', 'Defensa'),

('HAI5', 'Riga Mustapha', '1999-07-22', 180, 76, 'Don Bosco FC', FALSE, 'https://example.com/riga_mustapha.png', 'HAI', 'Defensa'),

('HAI6', 'Ricardo Adé', '1990-11-21', 190, 86, 'Aucas', TRUE, 'https://example.com/ricardo_ade.png', 'HAI', 'Defensa'),

('HAI7', 'Carlens Arcus', '1996-06-28', 178, 73, 'Auxerre', TRUE, 'https://example.com/carlens_arcus.png', 'HAI', 'Defensa'),

('HAI8', 'Derrick Etienne Jr', '1996-11-25', 178, 75, 'Atlanta United', TRUE, 'https://example.com/derrick_etienne.png', 'HAI', 'Volante'),

('HAI9', 'Alex Christian Jr', '1998-04-14', 181, 74, 'Real Hope FA', FALSE, 'https://example.com/alex_christian.png', 'HAI', 'Volante'),

('HAI10', 'Jean Jacques Pierre', '1981-01-15', 187, 82, 'Retirado', TRUE, 'https://example.com/jean_jacques_pierre.png', 'HAI', 'Volante'),

('HAI11', 'Frantzdy Pierrot', '1995-03-29', 197, 88, 'AEK Atenas', TRUE, 'https://example.com/frantzdy_pierrot.png', 'HAI', 'Delantero'),

('HAI12', 'Duckens Nazon', '1994-04-07', 180, 75, 'CSKA Sofia', TRUE, 'https://example.com/duckens_nazon.png', 'HAI', 'Delantero'),

-- Foto del equipo
('HAI13', 'Selección Haití 2026', NULL, NULL, NULL, 'Selección Haití', TRUE, 'https://example.com/seleccion_haiti_2026.png', 'HAI', 'EQUIPO'),

-- Más jugadores
('HAI14', 'Leverton Pierre', '2000-08-19', 176, 70, 'Violette AC', FALSE, 'https://example.com/leverton_pierre.png', 'HAI', 'Volante'),

('HAI15', 'Kervens Belfort', '1992-05-16', 184, 78, 'Sainte-Geneviève Sports', FALSE, 'https://example.com/kervens_belfort.png', 'HAI', 'Delantero'),

('HAI16', 'Bryan Alceus', '1996-02-15', 179, 73, 'Radnički Niš', FALSE, 'https://example.com/bryan_alceus.png', 'HAI', 'Volante'),

('HAI17', 'Steeven Saba', '1993-12-23', 180, 74, 'Violette AC', FALSE, 'https://example.com/steeven_saba.png', 'HAI', 'Volante'),

('HAI18', 'Jean-Kévin Duverne', '1997-07-12', 187, 80, 'FC Metz', TRUE, 'https://example.com/jean_kevin_duverne.png', 'HAI', 'Defensa'),

('HAI19', 'Alexandre Pierre', '1996-09-05', 185, 79, 'Club Franciscain', FALSE, 'https://example.com/alexandre_pierre.png', 'HAI', 'Defensa'),

('HAI20', 'Mikaël Cantave', '1997-01-03', 175, 70, 'Valour FC', FALSE, 'https://example.com/mikael_cantave.png', 'HAI', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'HAI'
WHERE id like 'HAI%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('SCO1', 'Escudo Selección Escocia', NULL, NULL, NULL, 'Selección Escocia', TRUE, 'https://example.com/escocia_escudo.png', 'SCO', 'ESCUDO'),

-- Jugadores
('SCO2', 'Craig Gordon', '1982-12-31', 193, 83, 'Hearts', TRUE, 'https://example.com/craig_gordon.png', 'SCO', 'Arquero'),

('SCO3', 'Angus Gunn', '1996-01-22', 196, 77, 'Norwich City', FALSE, 'https://example.com/angus_gunn.png', 'SCO', 'Arquero'),

('SCO4', 'Andy Robertson', '1994-03-11', 178, 64, 'Liverpool', TRUE, 'https://example.com/andy_robertson.png', 'SCO', 'Defensa'),

('SCO5', 'Kieran Tierney', '1997-06-05', 180, 70, 'Real Sociedad', TRUE, 'https://example.com/kieran_tierney.png', 'SCO', 'Defensa'),

('SCO6', 'Jack Hendry', '1995-05-07', 188, 83, 'Al-Ettifaq', FALSE, 'https://example.com/jack_hendry.png', 'SCO', 'Defensa'),

('SCO7', 'Scott McKenna', '1996-11-12', 189, 80, 'Las Palmas', FALSE, 'https://example.com/scott_mckenna.png', 'SCO', 'Defensa'),

('SCO8', 'John McGinn', '1994-10-18', 178, 68, 'Aston Villa', TRUE, 'https://example.com/john_mcginn.png', 'SCO', 'Volante'),

('SCO9', 'Callum McGregor', '1993-06-14', 178, 70, 'Celtic', TRUE, 'https://example.com/callum_mcgregor.png', 'SCO', 'Volante'),

('SCO10', 'Billy Gilmour', '2001-06-11', 170, 66, 'Brighton', TRUE, 'https://example.com/billy_gilmour.png', 'SCO', 'Volante'),

('SCO11', 'Ryan Christie', '1995-02-22', 178, 70, 'Bournemouth', FALSE, 'https://example.com/ryan_christie.png', 'SCO', 'Volante'),

('SCO12', 'Che Adams', '1996-07-13', 179, 72, 'Southampton', TRUE, 'https://example.com/che_adams.png', 'SCO', 'Delantero'),

-- Foto del equipo
('SCO13', 'Selección Escocia 2026', NULL, NULL, NULL, 'Selección Escocia', TRUE, 'https://example.com/seleccion_escocia_2026.png', 'SCO', 'EQUIPO'),

-- Más jugadores
('SCO14', 'Lyndon Dykes', '1995-10-07', 188, 86, 'Birmingham City', FALSE, 'https://example.com/lyndon_dykes.png', 'SCO', 'Delantero'),

('SCO15', 'Lawrence Shankland', '1995-08-10', 185, 80, 'Hearts', FALSE, 'https://example.com/lawrence_shankland.png', 'SCO', 'Delantero'),

('SCO16', 'Scott McTominay', '1996-12-08', 193, 88, 'Napoli', TRUE, 'https://example.com/scott_mctominay.png', 'SCO', 'Volante'),

('SCO17', 'Stuart Armstrong', '1992-03-30', 183, 73, 'Sheffield Wednesday', FALSE, 'https://example.com/stuart_armstrong.png', 'SCO', 'Volante'),

('SCO18', 'Aaron Hickey', '2002-06-10', 185, 72, 'Brentford', TRUE, 'https://example.com/aaron_hickey.png', 'SCO', 'Defensa'),

('SCO19', 'Ryan Porteous', '1999-03-25', 188, 82, 'Watford', FALSE, 'https://example.com/ryan_porteous.png', 'SCO', 'Defensa'),

('SCO20', 'Jacob Brown', '1998-04-10', 180, 74, 'Stoke City', FALSE, 'https://example.com/jacob_brown.png', 'SCO', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'SCO'
WHERE id like 'SCO%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('USA1', 'Escudo Selección Estados Unidos', NULL, NULL, NULL, 'Selección Estados Unidos', TRUE, 'https://example.com/usa_escudo.png', 'USA', 'ESCUDO'),

-- Jugadores
('USA2', 'Matt Turner', '1994-06-24', 191, 88, 'Crystal Palace', TRUE, 'https://example.com/matt_turner.png', 'USA', 'Arquero'),

('USA3', 'Ethan Horvath', '1995-06-09', 192, 88, 'Cardiff City', FALSE, 'https://example.com/ethan_horvath.png', 'USA', 'Arquero'),

('USA4', 'Sergiño Dest', '2000-11-03', 175, 68, 'PSV Eindhoven', TRUE, 'https://example.com/sergino_dest.png', 'USA', 'Defensa'),

('USA5', 'Tim Ream', '1987-10-05', 186, 79, 'Charlotte FC', FALSE, 'https://example.com/tim_ream.png', 'USA', 'Defensa'),

('USA6', 'Antonee Robinson', '1997-08-08', 183, 73, 'Fulham', TRUE, 'https://example.com/antonee_robinson.png', 'USA', 'Defensa'),

('USA7', 'Chris Richards', '2000-03-28', 188, 82, 'Crystal Palace', TRUE, 'https://example.com/chris_richards.png', 'USA', 'Defensa'),

('USA8', 'Tyler Adams', '1999-02-14', 175, 72, 'Bournemouth', TRUE, 'https://example.com/tyler_adams.png', 'USA', 'Volante'),

('USA9', 'Weston McKennie', '1998-08-28', 185, 84, 'Juventus', TRUE, 'https://example.com/weston_mckennie.png', 'USA', 'Volante'),

('USA10', 'Yunus Musah', '2002-11-29', 178, 73, 'AC Milan', TRUE, 'https://example.com/yunus_musah.png', 'USA', 'Volante'),

('USA11', 'Giovanni Reyna', '2002-11-13', 185, 78, 'Borussia Dortmund', TRUE, 'https://example.com/giovanni_reyna.png', 'USA', 'Mediapunta'),

('USA12', 'Christian Pulisic', '1998-09-18', 177, 73, 'AC Milan', TRUE, 'https://example.com/christian_pulisic.png', 'USA', 'Extremo'),

-- Foto del equipo
('USA13', 'Selección Estados Unidos 2026', NULL, NULL, NULL, 'Selección Estados Unidos', TRUE, 'https://example.com/seleccion_usa_2026.png', 'USA', 'EQUIPO'),

-- Más jugadores
('USA14', 'Folarin Balogun', '2001-07-03', 178, 70, 'AS Monaco', TRUE, 'https://example.com/folarin_balogun.png', 'USA', 'Delantero'),

('USA15', 'Ricardo Pepi', '2003-01-09', 185, 79, 'PSV Eindhoven', TRUE, 'https://example.com/ricardo_pepi.png', 'USA', 'Delantero'),

('USA16', 'Josh Sargent', '2000-02-20', 185, 80, 'Norwich City', FALSE, 'https://example.com/josh_sargent.png', 'USA', 'Delantero'),

('USA17', 'Brenden Aaronson', '2000-10-22', 178, 70, 'Leeds United', TRUE, 'https://example.com/brenden_aaronson.png', 'USA', 'Volante'),

('USA18', 'Kellyn Acosta', '1995-07-24', 177, 72, 'Chicago Fire', FALSE, 'https://example.com/kellyn_acosta.png', 'USA', 'Volante'),

('USA19', 'Mark McKenzie', '1999-02-25', 183, 79, 'Genk', FALSE, 'https://example.com/mark_mckenzie.png', 'USA', 'Defensa'),

('USA20', 'Tim Weah', '2000-02-22', 183, 73, 'Juventus', TRUE, 'https://example.com/tim_weah.png', 'USA', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'USA'
WHERE id like 'USA%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('PAR1', 'Escudo Selección Paraguay', NULL, NULL, NULL, 'Selección Paraguay', TRUE, 'https://example.com/paraguay_escudo.png', 'PAR', 'ESCUDO'),

-- Jugadores
('PAR2', 'Carlos Coronel', '1997-04-09', 191, 86, 'New York Red Bulls', TRUE, 'https://example.com/carlos_coronel.png', 'PAR', 'Arquero'),

('PAR3', 'Roberto Fernández', '1998-03-29', 188, 84, 'Cerro Porteño', FALSE, 'https://example.com/roberto_fernandez.png', 'PAR', 'Arquero'),

('PAR4', 'Gustavo Gómez', '1993-05-06', 185, 82, 'Palmeiras', TRUE, 'https://example.com/gustavo_gomez.png', 'PAR', 'Defensa'),

('PAR5', 'Junior Alonso', '1993-02-09', 185, 81, 'Atlético Mineiro', TRUE, 'https://example.com/junior_alonso.png', 'PAR', 'Defensa'),

('PAR6', 'Fabián Balbuena', '1991-08-23', 188, 85, 'Dínamo Moscú', FALSE, 'https://example.com/fabian_balbuena.png', 'PAR', 'Defensa'),

('PAR7', 'Alan Benítez', '1994-01-25', 178, 73, 'Libertad', FALSE, 'https://example.com/alan_benitez.png', 'PAR', 'Defensa'),

('PAR8', 'Andrés Cubas', '1996-05-15', 170, 68, 'Vancouver Whitecaps', TRUE, 'https://example.com/andres_cubas.png', 'PAR', 'Volante'),

('PAR9', 'Mathías Villasanti', '1997-01-24', 178, 72, 'Grêmio', TRUE, 'https://example.com/mathias_villasanti.png', 'PAR', 'Volante'),

('PAR10', 'Richard Sánchez', '1996-03-29', 175, 70, 'Club América', TRUE, 'https://example.com/richard_sanchez.png', 'PAR', 'Volante'),

('PAR11', 'Óscar Romero', '1992-07-04', 176, 69, 'Pendiente', FALSE, 'https://example.com/oscar_romero.png', 'PAR', 'Mediapunta'),

('PAR12', 'Miguel Almirón', '1994-02-10', 174, 67, 'Newcastle United', TRUE, 'https://example.com/miguel_almiron.png', 'PAR', 'Extremo'),

-- Equipo
('PAR13', 'Selección Paraguay 2026', NULL, NULL, NULL, 'Selección Paraguay', TRUE, 'https://example.com/seleccion_paraguay_2026.png', 'PAR', 'EQUIPO'),

-- Más jugadores
('PAR14', 'Julio Enciso', '2004-01-23', 173, 65, 'Brighton', TRUE, 'https://example.com/julio_enciso.png', 'PAR', 'Delantero'),

('PAR15', 'Antonio Sanabria', '1996-03-04', 180, 75, 'Torino', TRUE, 'https://example.com/antonio_sanabria.png', 'PAR', 'Delantero'),

('PAR16', 'Gabriel Ávalos', '1990-09-12', 187, 83, 'Independiente', FALSE, 'https://example.com/gabriel_avalos.png', 'PAR', 'Delantero'),

('PAR17', 'Braian Ojeda', '2000-06-27', 177, 71, 'Real Salt Lake', FALSE, 'https://example.com/braian_ojeda.png', 'PAR', 'Volante'),

('PAR18', 'Diego Gómez', '2003-03-27', 180, 73, 'Inter Miami', TRUE, 'https://example.com/diego_gomez.png', 'PAR', 'Volante'),

('PAR19', 'Omar Alderete', '1996-12-26', 188, 82, 'Getafe', TRUE, 'https://example.com/omar_alderete.png', 'PAR', 'Defensa'),

('PAR20', 'Gustavo Velázquez', '1991-08-17', 186, 80, 'Cerro Porteño', FALSE, 'https://example.com/gustavo_velazquez.png', 'PAR', 'Defensa');

UPDATE laminas_panini_2026
SET iso3 = 'PAR'
WHERE id like 'PAR%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('AUS1', 'Escudo Selección Australia', NULL, NULL, NULL, 'Selección Australia', TRUE, 'https://example.com/australia_escudo.png', 'AUS', 'ESCUDO'),

-- Jugadores
('AUS2', 'Mathew Ryan', '1992-04-08', 184, 82, 'AZ Alkmaar', TRUE, 'https://example.com/mathew_ryan.png', 'AUS', 'Arquero'),

('AUS3', 'Andrew Redmayne', '1989-01-13', 194, 89, 'Sydney FC', FALSE, 'https://example.com/andrew_redmayne.png', 'AUS', 'Arquero'),

('AUS4', 'Harry Souttar', '1998-10-22', 198, 96, 'Leicester City', TRUE, 'https://example.com/harry_souttar.png', 'AUS', 'Defensa'),

('AUS5', 'Kye Rowles', '1998-06-24', 185, 80, 'Heart of Midlothian', FALSE, 'https://example.com/kye_rowles.png', 'AUS', 'Defensa'),

('AUS6', 'Milos Degenek', '1994-04-28', 187, 85, 'Crvena Zvezda', FALSE, 'https://example.com/milos_degenek.png', 'AUS', 'Defensa'),

('AUS7', 'Aziz Behich', '1990-12-16', 170, 72, 'Melbourne City', FALSE, 'https://example.com/aziz_behich.png', 'AUS', 'Defensa'),

('AUS8', 'Jackson Irvine', '1993-03-07', 189, 77, 'St. Pauli', TRUE, 'https://example.com/jackson_irvine.png', 'AUS', 'Volante'),

('AUS9', 'Aaron Mooy', '1990-09-15', 175, 72, 'Retirado', TRUE, 'https://example.com/aaron_mooy.png', 'AUS', 'Volante'),

('AUS10', 'Ajdin Hrustic', '1996-07-06', 183, 74, 'Hellas Verona', FALSE, 'https://example.com/ajdin_hrustic.png', 'AUS', 'Volante'),

('AUS11', 'Craig Goodwin', '1991-12-16', 180, 75, 'Al-Wehda', TRUE, 'https://example.com/craig_goodwin.png', 'AUS', 'Extremo'),

('AUS12', 'Mathew Leckie', '1991-02-04', 181, 77, 'Melbourne City', TRUE, 'https://example.com/mathew_leckie.png', 'AUS', 'Delantero'),

-- Equipo
('AUS13', 'Selección Australia 2026', NULL, NULL, NULL, 'Selección Australia', TRUE, 'https://example.com/seleccion_australia_2026.png', 'AUS', 'EQUIPO'),

-- Más jugadores
('AUS14', 'Jamie Maclaren', '1993-07-29', 179, 72, 'Melbourne City', FALSE, 'https://example.com/jamie_maclaren.png', 'AUS', 'Delantero'),

('AUS15', 'Mitchell Duke', '1991-01-18', 186, 83, 'Fagiano Okayama', FALSE, 'https://example.com/mitchell_duke.png', 'AUS', 'Delantero'),

('AUS16', 'Kusini Yengi', '1999-01-15', 191, 85, 'Portsmouth', TRUE, 'https://example.com/kusini_yengi.png', 'AUS', 'Delantero'),

('AUS17', 'Denis Genreau', '1999-05-21', 175, 70, 'Toulouse', FALSE, 'https://example.com/denis_genreau.png', 'AUS', 'Volante'),

('AUS18', 'Connor Metcalfe', '1999-11-05', 180, 74, 'St. Pauli', FALSE, 'https://example.com/connor_metcalfe.png', 'AUS', 'Volante'),

('AUS19', 'Fran Karacic', '1996-05-12', 183, 78, 'Brescia', FALSE, 'https://example.com/fran_karacic.png', 'AUS', 'Defensa'),

('AUS20', 'Jordan Bos', '2002-10-29', 180, 73, 'Westerlo', TRUE, 'https://example.com/jordan_bos.png', 'AUS', 'Defensa');

UPDATE laminas_panini_2026
SET iso3 = 'AUS'
WHERE id like 'AUS%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('TUR1', 'Escudo Selección Turquía', NULL, NULL, NULL, 'Selección Turquía', TRUE, 'https://example.com/turquia_escudo.png', 'TUR', 'ESCUDO'),

-- Jugadores
('TUR2', 'Uğurcan Çakır', '1996-04-05', 191, 82, 'Trabzonspor', TRUE, 'https://example.com/ugurcan_cakir.png', 'TUR', 'Arquero'),

('TUR3', 'Altay Bayındır', '1998-04-14', 198, 88, 'Manchester United', FALSE, 'https://example.com/altay_bayindir.png', 'TUR', 'Arquero'),

('TUR4', 'Zeki Çelik', '1997-02-17', 180, 74, 'Roma', TRUE, 'https://example.com/zeki_celik.png', 'TUR', 'Defensa'),

('TUR5', 'Merih Demiral', '1998-03-05', 190, 86, 'Al-Ahli', TRUE, 'https://example.com/merih_demiral.png', 'TUR', 'Defensa'),

('TUR6', 'Ozan Kabak', '2000-03-25', 187, 84, 'Hoffenheim', FALSE, 'https://example.com/ozan_kabak.png', 'TUR', 'Defensa'),

('TUR7', 'Ferdi Kadıoğlu', '1999-10-07', 174, 72, 'Fenerbahçe', TRUE, 'https://example.com/ferdi_kadioglu.png', 'TUR', 'Defensa'),

('TUR8', 'Hakan Çalhanoğlu', '1994-02-08', 178, 74, 'Inter de Milán', TRUE, 'https://example.com/hakan_calhanoglu.png', 'TUR', 'Volante'),

('TUR9', 'Orkun Kökçü', '2000-12-29', 175, 72, 'Benfica', TRUE, 'https://example.com/orkun_kokcu.png', 'TUR', 'Volante'),

('TUR10', 'Salih Özcan', '1998-01-11', 182, 75, 'Borussia Dortmund', FALSE, 'https://example.com/salih_ozcan.png', 'TUR', 'Volante'),

('TUR11', 'Arda Güler', '2005-02-25', 176, 68, 'Real Madrid', TRUE, 'https://example.com/arda_guler.png', 'TUR', 'Mediapunta'),

('TUR12', 'Cengiz Ünder', '1997-07-14', 173, 67, 'Fenerbahçe', TRUE, 'https://example.com/cengiz_under.png', 'TUR', 'Extremo'),

-- Equipo
('TUR13', 'Selección Turquía 2026', NULL, NULL, NULL, 'Selección Turquía', TRUE, 'https://example.com/seleccion_turquia_2026.png', 'TUR', 'EQUIPO'),

-- Más jugadores
('TUR14', 'Enes Ünal', '1997-05-10', 187, 83, 'Bournemouth', FALSE, 'https://example.com/enes_unal.png', 'TUR', 'Delantero'),

('TUR15', 'Kerem Aktürkoğlu', '1998-10-21', 173, 69, 'Galatasaray', TRUE, 'https://example.com/kerem_akturkoglu.png', 'TUR', 'Extremo'),

('TUR16', 'Barış Alper Yılmaz', '2000-05-23', 186, 78, 'Galatasaray', FALSE, 'https://example.com/baris_alper_yilmaz.png', 'TUR', 'Delantero'),

('TUR17', 'Halil Dervişoğlu', '1999-12-08', 183, 76, 'Burnley', FALSE, 'https://example.com/halil_dervisoglu.png', 'TUR', 'Delantero'),

('TUR18', 'Abdülkerim Bardakcı', '1994-09-07', 187, 82, 'Galatasaray', TRUE, 'https://example.com/abdulkerim_bardakci.png', 'TUR', 'Defensa'),

('TUR19', 'Çağlar Söyüncü', '1996-05-23', 185, 80, 'Fenerbahçe', TRUE, 'https://example.com/caglar_soyuncu.png', 'TUR', 'Defensa'),

('TUR20', 'İrfan Can Kahveci', '1995-07-15', 176, 71, 'Fenerbahçe', TRUE, 'https://example.com/irfan_can_kahveci.png', 'TUR', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'TUR'
WHERE id like 'TUR%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('GER1', 'Escudo Selección Alemania', NULL, NULL, NULL, 'Selección Alemania', TRUE, 'https://example.com/alemania_escudo.png', 'GER', 'ESCUDO'),

-- Jugadores
('GER2', 'Manuel Neuer', '1986-03-27', 193, 92, 'Bayern Munich', TRUE, 'https://example.com/manuel_neuer.png', 'GER', 'Arquero'),

('GER3', 'Marc-André ter Stegen', '1992-04-30', 187, 85, 'Barcelona', TRUE, 'https://example.com/ter_stegen.png', 'GER', 'Arquero'),

('GER4', 'Antonio Rüdiger', '1993-03-03', 190, 85, 'Real Madrid', TRUE, 'https://example.com/antonio_rudiger.png', 'GER', 'Defensa'),

('GER5', 'Niklas Süle', '1995-09-03', 195, 99, 'Borussia Dortmund', FALSE, 'https://example.com/niklas_sule.png', 'GER', 'Defensa'),

('GER6', 'Jonathan Tah', '1996-02-11', 195, 94, 'Bayer Leverkusen', TRUE, 'https://example.com/jonathan_tah.png', 'GER', 'Defensa'),

('GER7', 'Benjamin Henrichs', '1997-02-23', 185, 79, 'RB Leipzig', FALSE, 'https://example.com/benjamin_henrichs.png', 'GER', 'Defensa'),

('GER8', 'Joshua Kimmich', '1995-02-08', 177, 75, 'Bayern Munich', TRUE, 'https://example.com/joshua_kimmich.png', 'GER', 'Volante'),

('GER9', 'Leon Goretzka', '1995-02-06', 189, 82, 'Bayern Munich', TRUE, 'https://example.com/leon_goretzka.png', 'GER', 'Volante'),

('GER10', 'Ilkay Gündogan', '1990-10-24', 180, 80, 'Barcelona', TRUE, 'https://example.com/ilkay_gundogan.png', 'GER', 'Volante'),

('GER11', 'Florian Wirtz', '2003-05-03', 176, 70, 'Bayer Leverkusen', TRUE, 'https://example.com/florian_wirtz.png', 'GER', 'Mediapunta'),

('GER12', 'Jamal Musiala', '2003-02-26', 184, 74, 'Bayern Munich', TRUE, 'https://example.com/jamal_musiala.png', 'GER', 'Mediapunta'),

-- Equipo
('GER13', 'Selección Alemania 2026', NULL, NULL, NULL, 'Selección Alemania', TRUE, 'https://example.com/seleccion_alemania_2026.png', 'GER', 'EQUIPO'),

-- Más jugadores
('GER14', 'Kai Havertz', '1999-06-11', 193, 83, 'Arsenal', TRUE, 'https://example.com/kai_havertz.png', 'GER', 'Delantero'),

('GER15', 'Timo Werner', '1996-03-06', 180, 75, 'RB Leipzig', FALSE, 'https://example.com/timo_werner.png', 'GER', 'Delantero'),

('GER16', 'Serge Gnabry', '1995-07-14', 176, 77, 'Bayern Munich', TRUE, 'https://example.com/serge_gnabry.png', 'GER', 'Extremo'),

('GER17', 'Leroy Sané', '1996-01-11', 183, 80, 'Bayern Munich', TRUE, 'https://example.com/leroy_sane.png', 'GER', 'Extremo'),

('GER18', 'Niclas Füllkrug', '1993-02-09', 189, 90, 'Borussia Dortmund', TRUE, 'https://example.com/niclas_fullkrug.png', 'GER', 'Delantero'),

('GER19', 'Robin Gosens', '1994-07-05', 183, 76, 'Union Berlin', FALSE, 'https://example.com/robin_gosens.png', 'GER', 'Defensa'),

('GER20', 'David Raum', '1998-04-22', 180, 75, 'RB Leipzig', FALSE, 'https://example.com/david_raum.png', 'GER', 'Defensa');

UPDATE laminas_panini_2026
SET iso3 = 'GER'
WHERE id like 'GER%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('CUW1', 'Escudo Selección Curaçao', NULL, NULL, NULL, 'Selección Curaçao', TRUE, 'https://example.com/curacao_escudo.png', 'CUW', 'ESCUDO'),

-- Jugadores
('CUW2', 'Eloy Room', '1989-02-06', 190, 84, 'Columbus Crew', TRUE, 'https://example.com/eloy_room.png', 'CUW', 'Arquero'),

('CUW3', 'Remko Bicentini', '1968-08-20', 180, 78, 'Entrenador', FALSE, 'https://example.com/bicentini.png', 'CUW', 'Arquero'),

('CUW4', 'Cuco Martina', '1989-09-25', 185, 80, 'Sparta Rotterdam', TRUE, 'https://example.com/cuco_martina.png', 'CUW', 'Defensa'),

('CUW5', 'Gervane Kastaneer', '1996-06-29', 183, 78, 'PEC Zwolle', FALSE, 'https://example.com/kastaneer.png', 'CUW', 'Delantero'),

('CUW6', 'Shermar Martina', '1996-03-08', 178, 74, 'MVV Maastricht', FALSE, 'https://example.com/shermar_martina.png', 'CUW', 'Defensa'),

('CUW7', 'Roshon van Eijma', '1997-03-15', 187, 82, 'TOP Oss', FALSE, 'https://example.com/van_eijma.png', 'CUW', 'Defensa'),

('CUW8', 'Brandley Kuwas', '1992-09-19', 175, 72, 'Al-Nasr', TRUE, 'https://example.com/kuwas.png', 'CUW', 'Extremo'),

('CUW9', 'Leandro Bacuna', '1991-08-21', 187, 79, 'FC Groningen', TRUE, 'https://example.com/leandro_bacuna.png', 'CUW', 'Volante'),

('CUW10', 'Juninho Bacuna', '1997-08-07', 178, 74, 'Al-Wehda', TRUE, 'https://example.com/juninho_bacuna.png', 'CUW', 'Volante'),

('CUW11', 'Juriën Gaari', '1993-12-23', 181, 76, 'RKC Waalwijk', FALSE, 'https://example.com/gari.png', 'CUW', 'Defensa'),

('CUW12', 'Gino van Kessel', '1993-08-09', 180, 75, 'Free Agent', FALSE, 'https://example.com/van_kessel.png', 'CUW', 'Delantero'),

-- Equipo
('CUW13', 'Selección Curaçao 2026', NULL, NULL, NULL, 'Selección Curaçao', TRUE, 'https://example.com/seleccion_curacao_2026.png', 'CUW', 'EQUIPO'),

-- Más jugadores
('CUW14', 'Elson Hooi', '1991-05-31', 174, 70, 'Al Dhafra', FALSE, 'https://example.com/elson_hooi.png', 'CUW', 'Extremo'),

('CUW15', 'Rangelo Janga', '1992-04-16', 196, 90, 'Adana Demirspor', TRUE, 'https://example.com/rangelo_janga.png', 'CUW', 'Delantero'),

('CUW16', 'Felitciano Zschusschen', '1992-01-24', 182, 76, 'RKSV Leonidas', FALSE, 'https://example.com/zschusschen.png', 'CUW', 'Delantero'),

('CUW17', 'Arvin Slagveer', '1993-06-12', 173, 68, 'FC Volendam', FALSE, 'https://example.com/slagveer.png', 'CUW', 'Extremo'),

('CUW18', 'Jarchinio Antonia', '1990-12-27', 170, 69, 'Go Ahead Eagles', FALSE, 'https://example.com/antonia.png', 'CUW', 'Extremo'),

('CUW19', 'Shermar Peiffer', '1996-07-11', 180, 74, 'RKSV Scherpenheuvel', FALSE, 'https://example.com/peiffer.png', 'CUW', 'Defensa'),

('CUW20', 'Roly Bonevacia', '1991-10-08', 180, 73, 'Wellington Phoenix', TRUE, 'https://example.com/bonevacia.png', 'CUW', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'CUW'
WHERE id like 'CUW%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('CIV1', 'Escudo Selección Costa de Marfil', NULL, NULL, NULL, 'Selección Costa de Marfil', TRUE, 'https://example.com/costa_de_marfil_escudo.png', 'CIV', 'ESCUDO'),

-- Jugadores
('CIV2', 'Yahia Fofana', '2000-08-21', 194, 85, 'Angers SCO', TRUE, 'https://example.com/yahia_fofana.png', 'CIV', 'Arquero'),

('CIV3', 'Badra Ali Sangaré', '1986-08-30', 191, 86, 'ASEC Mimosas', FALSE, 'https://example.com/badra_sangare.png', 'CIV', 'Arquero'),

('CIV4', 'Serge Aurier', '1992-12-24', 176, 75, 'Galatasaray', TRUE, 'https://example.com/serge_aurier.png', 'CIV', 'Defensa'),

('CIV5', 'Ousmane Diomande', '2003-12-04', 190, 84, 'Sporting CP', TRUE, 'https://example.com/ousmane_diomande.png', 'CIV', 'Defensa'),

('CIV6', 'Evan Ndicka', '1999-08-20', 192, 85, 'Roma', TRUE, 'https://example.com/evan_ndicka.png', 'CIV', 'Defensa'),

('CIV7', 'Wilfried Singo', '2000-12-12', 190, 80, 'Monaco', TRUE, 'https://example.com/wilfried_singo.png', 'CIV', 'Defensa'),

('CIV8', 'Franck Kessié', '1996-12-19', 183, 76, 'Al-Ahli', TRUE, 'https://example.com/franck_kessie.png', 'CIV', 'Volante'),

('CIV9', 'Seko Fofana', '1995-05-07', 184, 74, 'Al Nassr', TRUE, 'https://example.com/seko_fofana.png', 'CIV', 'Volante'),

('CIV10', 'Hamed Traorè', '2000-02-16', 177, 70, 'Bournemouth', FALSE, 'https://example.com/hamed_traore.png', 'CIV', 'Volante'),

('CIV11', 'Max-Alain Gradel', '1987-11-30', 175, 71, 'Free Agent', FALSE, 'https://example.com/max_alain_gradel.png', 'CIV', 'Extremo'),

('CIV12', 'Sebastien Haller', '1994-06-22', 190, 88, 'Borussia Dortmund', TRUE, 'https://example.com/sebastien_haller.png', 'CIV', 'Delantero'),

-- Equipo
('CIV13', 'Selección Costa de Marfil 2026', NULL, NULL, NULL, 'Selección Costa de Marfil', TRUE, 'https://example.com/seleccion_costa_de_marfil_2026.png', 'CIV', 'EQUIPO'),

-- Más jugadores
('CIV14', 'Nicolas Pépé', '1995-05-29', 183, 73, 'Trabzonspor', TRUE, 'https://example.com/nicolas_pepe.png', 'CIV', 'Extremo'),

('CIV15', 'Simon Adingra', '2002-01-01', 175, 69, 'Brighton', TRUE, 'https://example.com/simon_adingra.png', 'CIV', 'Extremo'),

('CIV16', 'Jean-Philippe Krasso', '1997-07-17', 187, 81, 'Crvena Zvezda', FALSE, 'https://example.com/krasso.png', 'CIV', 'Delantero'),

('CIV17', 'Christian Kouamé', '1997-12-06', 185, 79, 'Fiorentina', FALSE, 'https://example.com/kouame.png', 'CIV', 'Delantero'),

('CIV18', 'Ghislain Konan', '1995-12-27', 176, 70, 'Al-Fayha', FALSE, 'https://example.com/ghislain_konan.png', 'CIV', 'Defensa'),

('CIV19', 'Jean Michaël Seri', '1991-07-19', 168, 69, 'Al-Orobah', FALSE, 'https://example.com/jean_michael_seri.png', 'CIV', 'Volante'),

('CIV20', 'Ismaël Doumbia', '1999-05-21', 187, 80, 'Benevento', FALSE, 'https://example.com/ismael_doumbia.png', 'CIV', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'CIV'
WHERE id like 'CIV%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('ECU1', 'Escudo Selección Ecuador', NULL, NULL, NULL, 'Selección Ecuador', TRUE, 'https://example.com/ecuador_escudo.png', 'ECU', 'ESCUDO'),

-- Jugadores
('ECU2', 'Hernán Galíndez', '1987-03-30', 186, 82, 'Aucas', TRUE, 'https://example.com/galindez.png', 'ECU', 'Arquero'),

('ECU3', 'Alexander Domínguez', '1987-06-05', 193, 86, 'Liga de Quito', FALSE, 'https://example.com/dominguez.png', 'ECU', 'Arquero'),

('ECU4', 'Piero Hincapié', '2002-01-09', 184, 77, 'Bayer Leverkusen', TRUE, 'https://example.com/hincapie.png', 'ECU', 'Defensa'),

('ECU5', 'Félix Torres', '1997-01-11', 187, 83, 'Santos Laguna', TRUE, 'https://example.com/felix_torres.png', 'ECU', 'Defensa'),

('ECU6', 'Robert Arboleda', '1991-10-22', 187, 85, 'São Paulo', FALSE, 'https://example.com/arboleda.png', 'ECU', 'Defensa'),

('ECU7', 'Willian Pacho', '2001-10-16', 187, 80, 'Eintracht Frankfurt', TRUE, 'https://example.com/pacho.png', 'ECU', 'Defensa'),

('ECU8', 'Moisés Caicedo', '2001-11-02', 178, 73, 'Chelsea', TRUE, 'https://example.com/caicedo.png', 'ECU', 'Volante'),

('ECU9', 'Carlos Gruezo', '1995-04-19', 170, 68, 'FC Dallas', FALSE, 'https://example.com/gruezo.png', 'ECU', 'Volante'),

('ECU10', 'Alan Franco', '1998-08-21', 175, 70, 'Atlético Mineiro', FALSE, 'https://example.com/alan_franco.png', 'ECU', 'Volante'),

('ECU11', 'Pervis Estupiñán', '1998-01-21', 175, 69, 'Brighton', TRUE, 'https://example.com/estupinan.png', 'ECU', 'Lateral'),

('ECU12', 'Ángel Mena', '1988-05-21', 168, 65, 'Club León', TRUE, 'https://example.com/angel_mena.png', 'ECU', 'Extremo'),

-- Equipo
('ECU13', 'Selección Ecuador 2026', NULL, NULL, NULL, 'Selección Ecuador', TRUE, 'https://example.com/seleccion_ecuador_2026.png', 'ECU', 'EQUIPO'),

-- Más jugadores
('ECU14', 'Enner Valencia', '1989-11-04', 177, 74, 'Internacional', TRUE, 'https://example.com/enner_valencia.png', 'ECU', 'Delantero'),

('ECU15', 'Michael Estrada', '1996-04-07', 187, 80, 'Cruz Azul', FALSE, 'https://example.com/estrada.png', 'ECU', 'Delantero'),

('ECU16', 'Gonzalo Plata', '2000-11-01', 178, 70, 'Al Sadd', TRUE, 'https://example.com/plata.png', 'ECU', 'Extremo'),

('ECU17', 'Jeremy Sarmiento', '2002-06-16', 178, 72, 'Ipswich Town', TRUE, 'https://example.com/sarmiento.png', 'ECU', 'Extremo'),

('ECU18', 'Romario Ibarra', '1994-09-24', 178, 73, 'Real Oviedo', FALSE, 'https://example.com/romario_ibarra.png', 'ECU', 'Extremo'),

('ECU19', 'Kevin Rodríguez', '2000-03-04', 180, 75, 'Union Saint-Gilloise', FALSE, 'https://example.com/kevin_rodriguez.png', 'ECU', 'Delantero'),

('ECU20', 'Jhegson Méndez', '1997-04-26', 177, 74, 'Los Angeles FC', FALSE, 'https://example.com/jhegson_mendez.png', 'ECU', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'ECU'
WHERE id like 'ECU%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('NED1', 'Escudo Selección Países Bajos', NULL, NULL, NULL, 'Selección Países Bajos', TRUE, 'https://example.com/paises_bajos_escudo.png', 'NED', 'ESCUDO'),

-- Jugadores
('NED2', 'Bart Verbruggen', '2002-08-18', 194, 85, 'Brighton', TRUE, 'https://example.com/verbruggen.png', 'NED', 'Arquero'),

('NED3', 'Justin Bijlow', '1998-01-22', 188, 76, 'Feyenoord', FALSE, 'https://example.com/bijlow.png', 'NED', 'Arquero'),

('NED4', 'Virgil van Dijk', '1991-07-08', 193, 92, 'Liverpool', TRUE, 'https://example.com/van_dijk.png', 'NED', 'Defensa'),

('NED5', 'Matthijs de Ligt', '1999-08-12', 189, 89, 'Bayern Munich', TRUE, 'https://example.com/de_ligt.png', 'NED', 'Defensa'),

('NED6', 'Nathan Aké', '1995-02-18', 180, 75, 'Manchester City', TRUE, 'https://example.com/nathan_ake.png', 'NED', 'Defensa'),

('NED7', 'Stefan de Vrij', '1992-02-05', 189, 78, 'Inter de Milán', FALSE, 'https://example.com/de_vrij.png', 'NED', 'Defensa'),

('NED8', 'Frenkie de Jong', '1997-05-12', 180, 74, 'Barcelona', TRUE, 'https://example.com/frenkie_de_jong.png', 'NED', 'Volante'),

('NED9', 'Teun Koopmeiners', '1998-02-28', 184, 77, 'Atalanta', TRUE, 'https://example.com/koopmeiners.png', 'NED', 'Volante'),

('NED10', 'Marten de Roon', '1991-03-29', 185, 76, 'Atalanta', FALSE, 'https://example.com/de_roon.png', 'NED', 'Volante'),

('NED11', 'Xavi Simons', '2003-04-21', 179, 70, 'RB Leipzig', TRUE, 'https://example.com/xavi_simons.png', 'NED', 'Mediapunta'),

('NED12', 'Cody Gakpo', '1999-05-07', 189, 76, 'Liverpool', TRUE, 'https://example.com/gakpo.png', 'NED', 'Extremo'),

-- Equipo
('NED13', 'Selección Países Bajos 2026', NULL, NULL, NULL, 'Selección Países Bajos', TRUE, 'https://example.com/seleccion_paises_bajos_2026.png', 'NED', 'EQUIPO'),

-- Más jugadores
('NED14', 'Memphis Depay', '1994-02-13', 176, 78, 'Corinthians', TRUE, 'https://example.com/depay.png', 'NED', 'Delantero'),

('NED15', 'Steven Bergwijn', '1997-10-08', 178, 78, 'Ajax', FALSE, 'https://example.com/bergwijn.png', 'NED', 'Extremo'),

('NED16', 'Donyell Malen', '1999-01-19', 176, 77, 'Borussia Dortmund', TRUE, 'https://example.com/malen.png', 'NED', 'Delantero'),

('NED17', 'Wout Weghorst', '1992-08-07', 197, 97, 'Hoffenheim', TRUE, 'https://example.com/weghorst.png', 'NED', 'Delantero'),

('NED18', 'Jeremie Frimpong', '2000-12-10', 172, 65, 'Bayer Leverkusen', TRUE, 'https://example.com/frimpong.png', 'NED', 'Lateral'),

('NED19', 'Daley Blind', '1990-03-09', 180, 72, 'Girona', FALSE, 'https://example.com/blind.png', 'NED', 'Defensa'),

('NED20', 'Noa Lang', '1999-06-17', 170, 68, 'PSV Eindhoven', TRUE, 'https://example.com/noa_lang.png', 'NED', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'NED'
WHERE id like 'NED%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('JPN1', 'Escudo Selección Japón', NULL, NULL, NULL, 'Selección Japón', TRUE, 'https://example.com/japon_escudo.png', 'JPN', 'ESCUDO'),

-- Jugadores
('JPN2', 'Zion Suzuki', '2002-08-21', 190, 84, 'Parma', TRUE, 'https://example.com/zion_suzuki.png', 'JPN', 'Arquero'),

('JPN3', 'Daniel Schmidt', '1992-02-03', 197, 90, 'Sint-Truiden', FALSE, 'https://example.com/daniel_schmidt.png', 'JPN', 'Arquero'),

('JPN4', 'Takehiro Tomiyasu', '1998-11-05', 187, 84, 'Arsenal', TRUE, 'https://example.com/tomiyasu.png', 'JPN', 'Defensa'),

('JPN5', 'Koki Machida', '1997-08-25', 190, 83, 'Union Saint-Gilloise', FALSE, 'https://example.com/machida.png', 'JPN', 'Defensa'),

('JPN6', 'Ko Itakura', '1997-01-27', 188, 80, 'Borussia Mönchengladbach', TRUE, 'https://example.com/itakura.png', 'JPN', 'Defensa'),

('JPN7', 'Yuto Nagatomo', '1986-09-12', 170, 68, 'FC Tokyo', TRUE, 'https://example.com/nagatomo.png', 'JPN', 'Defensa'),

('JPN8', 'Wataru Endo', '1993-02-09', 178, 75, 'Liverpool', TRUE, 'https://example.com/endo.png', 'JPN', 'Volante'),

('JPN9', 'Hidemasa Morita', '1995-05-10', 177, 73, 'Sporting CP', TRUE, 'https://example.com/morita.png', 'JPN', 'Volante'),

('JPN10', 'Ao Tanaka', '1998-09-10', 180, 74, 'Fortuna Düsseldorf', FALSE, 'https://example.com/tanaka.png', 'JPN', 'Volante'),

('JPN11', 'Takefusa Kubo', '2001-06-04', 173, 67, 'Real Sociedad', TRUE, 'https://example.com/kubo.png', 'JPN', 'Extremo'),

('JPN12', 'Daichi Kamada', '1996-08-05', 180, 72, 'Crystal Palace', TRUE, 'https://example.com/kamada.png', 'JPN', 'Mediapunta'),

-- Equipo
('JPN13', 'Selección Japón 2026', NULL, NULL, NULL, 'Selección Japón', TRUE, 'https://example.com/seleccion_japon_2026.png', 'JPN', 'EQUIPO'),

-- Más jugadores
('JPN14', 'Kaoru Mitoma', '1997-05-20', 178, 72, 'Brighton', TRUE, 'https://example.com/mitoma.png', 'JPN', 'Extremo'),

('JPN15', 'Ritsu Doan', '1998-06-16', 172, 70, 'SC Freiburg', TRUE, 'https://example.com/doan.png', 'JPN', 'Extremo'),

('JPN16', 'Ayase Ueda', '1998-08-28', 182, 76, 'Feyenoord', TRUE, 'https://example.com/ueda.png', 'JPN', 'Delantero'),

('JPN17', 'Takumi Minamino', '1995-01-16', 172, 67, 'AS Monaco', TRUE, 'https://example.com/minamino.png', 'JPN', 'Extremo'),

('JPN18', 'Shuto Machino', '1999-09-30', 185, 80, 'Holstein Kiel', FALSE, 'https://example.com/machino.png', 'JPN', 'Delantero'),

('JPN19', 'Junya Ito', '1993-03-09', 176, 68, 'Reims', TRUE, 'https://example.com/ito.png', 'JPN', 'Extremo'),

('JPN20', 'Takuma Asano', '1994-11-10', 173, 69, 'VfL Bochum', FALSE, 'https://example.com/asano.png', 'JPN', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'JPN'
WHERE id like 'JPN%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('SWE1', 'Escudo Selección Suecia', NULL, NULL, NULL, 'Selección Suecia', TRUE, 'https://example.com/suecia_escudo.png', 'SWE', 'ESCUDO'),

-- Jugadores
('SWE2', 'Robin Olsen', '1990-01-08', 198, 94, 'Aston Villa', TRUE, 'https://example.com/robin_olsen.png', 'SWE', 'Arquero'),

('SWE3', 'Kristoffer Nordfeldt', '1989-06-23', 190, 86, 'AIK', FALSE, 'https://example.com/nordfeldt.png', 'SWE', 'Arquero'),

('SWE4', 'Victor Lindelöf', '1994-07-17', 187, 80, 'Manchester United', TRUE, 'https://example.com/lindelof.png', 'SWE', 'Defensa'),

('SWE5', 'Isak Hien', '1999-01-13', 191, 85, 'Atalanta', TRUE, 'https://example.com/isak_hien.png', 'SWE', 'Defensa'),

('SWE6', 'Carl Starfelt', '1995-06-01', 187, 82, 'Celta de Vigo', FALSE, 'https://example.com/starfelt.png', 'SWE', 'Defensa'),

('SWE7', 'Emil Holm', '2000-05-13', 191, 84, 'Bologna', TRUE, 'https://example.com/emil_holm.png', 'SWE', 'Defensa'),

('SWE8', 'Dejan Kulusevski', '2000-04-25', 186, 80, 'Tottenham', TRUE, 'https://example.com/kulusevski.png', 'SWE', 'Extremo'),

('SWE9', 'Alexander Isak', '1999-09-21', 192, 77, 'Newcastle United', TRUE, 'https://example.com/isak.png', 'SWE', 'Delantero'),

('SWE10', 'Emil Forsberg', '1991-10-23', 177, 76, 'New York Red Bulls', TRUE, 'https://example.com/forsberg.png', 'SWE', 'Extremo'),

('SWE11', 'Mattias Svanberg', '1999-01-05', 185, 79, 'Wolfsburg', FALSE, 'https://example.com/svanberg.png', 'SWE', 'Volante'),

('SWE12', 'Jesper Karlström', '1995-06-21', 185, 80, 'Lech Poznań', FALSE, 'https://example.com/karlstrom.png', 'SWE', 'Volante'),

-- Equipo
('SWE13', 'Selección Suecia 2026', NULL, NULL, NULL, 'Selección Suecia', TRUE, 'https://example.com/seleccion_suecia_2026.png', 'SWE', 'EQUIPO'),

-- Más jugadores
('SWE14', 'Anthony Elanga', '2002-04-27', 178, 75, 'Nottingham Forest', TRUE, 'https://example.com/elanga.png', 'SWE', 'Extremo'),

('SWE15', 'Viktor Gyökeres', '1998-06-04', 187, 83, 'Sporting CP', TRUE, 'https://example.com/gyokeres.png', 'SWE', 'Delantero'),

('SWE16', 'Robin Quaison', '1993-10-09', 183, 75, 'Al-Ettifaq', FALSE, 'https://example.com/quaison.png', 'SWE', 'Delantero'),

('SWE17', 'Ken Sema', '1993-09-30', 180, 77, 'Watford', FALSE, 'https://example.com/sema.png', 'SWE', 'Extremo'),

('SWE18', 'Jesper Karlsson', '1998-07-29', 173, 70, 'Bologna', TRUE, 'https://example.com/karlsson.png', 'SWE', 'Extremo'),

('SWE19', 'Albin Ekdal', '1989-07-28', 186, 79, 'Sampdoria', FALSE, 'https://example.com/ekdal.png', 'SWE', 'Volante'),

('SWE20', 'Hugo Larsson', '2004-06-27', 187, 78, 'Eintracht Frankfurt', TRUE, 'https://example.com/larsson.png', 'SWE', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'SWE'
WHERE id like 'SWE%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('TUN1', 'Escudo Selección Túnez', NULL, NULL, NULL, 'Selección Túnez', TRUE, 'https://example.com/tunez_escudo.png', 'TUN', 'ESCUDO'),

-- Jugadores
('TUN2', 'Aymen Dahmen', '1997-01-28', 190, 82, 'CS Sfaxien', TRUE, 'https://example.com/aymen_dahmen.png', 'TUN', 'Arquero'),

('TUN3', 'Bechir Ben Said', '1994-06-29', 188, 80, 'Espérance de Tunis', FALSE, 'https://example.com/ben_said.png', 'TUN', 'Arquero'),

('TUN4', 'Yassine Meriah', '1993-07-02', 188, 83, 'Espérance de Tunis', TRUE, 'https://example.com/yassine_meriah.png', 'TUN', 'Defensa'),

('TUN5', 'Montassar Talbi', '1998-05-26', 190, 84, 'Lorient', TRUE, 'https://example.com/montassar_talbi.png', 'TUN', 'Defensa'),

('TUN6', 'Dylan Bronn', '1995-06-19', 185, 80, 'Salernitana', FALSE, 'https://example.com/dylan_bronn.png', 'TUN', 'Defensa'),

('TUN7', 'Ali Maâloul', '1990-01-01', 175, 70, 'Al Ahly', TRUE, 'https://example.com/ali_maaloul.png', 'TUN', 'Defensa'),

('TUN8', 'Ellyes Skhiri', '1995-05-10', 185, 75, 'Eintracht Frankfurt', TRUE, 'https://example.com/ellyes_skhiri.png', 'TUN', 'Volante'),

('TUN9', 'Aissa Laïdouni', '1996-12-03', 184, 76, 'Ferencváros', TRUE, 'https://example.com/aissa_laidouni.png', 'TUN', 'Volante'),

('TUN10', 'Ferjani Sassi', '1992-03-18', 189, 80, 'Al Duhail', FALSE, 'https://example.com/ferjani_sassi.png', 'TUN', 'Volante'),

('TUN11', 'Naïm Sliti', '1992-07-27', 175, 71, 'Al-Shamal', FALSE, 'https://example.com/naim_sliti.png', 'TUN', 'Extremo'),

('TUN12', 'Wahbi Khazri', '1991-02-08', 176, 74, 'Montpellier', TRUE, 'https://example.com/wahbi_khazri.png', 'TUN', 'Delantero'),

-- Equipo
('TUN13', 'Selección Túnez 2026', NULL, NULL, NULL, 'Selección Túnez', TRUE, 'https://example.com/seleccion_tunez_2026.png', 'TUN', 'EQUIPO'),

-- Más jugadores
('TUN14', 'Seifeddine Jaziri', '1993-02-11', 184, 78, 'Zamalek', FALSE, 'https://example.com/jaziri.png', 'TUN', 'Delantero'),

('TUN15', 'Issam Jebali', '1991-12-25', 186, 80, 'Gamba Osaka', TRUE, 'https://example.com/issam_jebali.png', 'TUN', 'Delantero'),

('TUN16', 'Hamdi Nagguez', '1992-10-28', 190, 83, 'Zamalek', FALSE, 'https://example.com/nagguez.png', 'TUN', 'Defensa'),

('TUN17', 'Mohamed Dräger', '1996-06-25', 180, 75, 'FC Luzern', FALSE, 'https://example.com/drager.png', 'TUN', 'Defensa'),

('TUN18', 'Mortadha Ben Ouanes', '1994-07-27', 177, 73, 'Kasımpaşa', FALSE, 'https://example.com/benouanes.png', 'TUN', 'Defensa'),

('TUN19', 'Anis Ben Slimane', '2001-03-16', 187, 79, 'Sheffield United', TRUE, 'https://example.com/ben_slimane.png', 'TUN', 'Volante'),

('TUN20', 'Ellyes Jelassi', '1994-07-03', 178, 72, 'Club Africain', FALSE, 'https://example.com/jelassi.png', 'TUN', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'TUN'
WHERE id like 'TUN%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('BEL1', 'Escudo Selección Bélgica', NULL, NULL, NULL, 'Selección Bélgica', TRUE, 'https://example.com/belgica_escudo.png', 'BEL', 'ESCUDO'),

-- Jugadores
('BEL2', 'Thibaut Courtois', '1992-05-11', 200, 96, 'Real Madrid', TRUE, 'https://example.com/courtois.png', 'BEL', 'Arquero'),

('BEL3', 'Koen Casteels', '1992-06-25', 197, 86, 'Al-Qadsiah', FALSE, 'https://example.com/casteels.png', 'BEL', 'Arquero'),

('BEL4', 'Toby Alderweireld', '1989-03-02', 187, 81, 'Antwerp', TRUE, 'https://example.com/alderweireld.png', 'BEL', 'Defensa'),

('BEL5', 'Jan Vertonghen', '1987-04-24', 189, 80, 'Anderlecht', TRUE, 'https://example.com/vertonghen.png', 'BEL', 'Defensa'),

('BEL6', 'Zeno Debast', '2003-10-24', 191, 84, 'Sporting CP', FALSE, 'https://example.com/debast.png', 'BEL', 'Defensa'),

('BEL7', 'Wout Faes', '1998-04-03', 187, 82, 'Leicester City', FALSE, 'https://example.com/faes.png', 'BEL', 'Defensa'),

('BEL8', 'Kevin De Bruyne', '1991-06-28', 181, 74, 'Manchester City', TRUE, 'https://example.com/debruyne.png', 'BEL', 'Volante'),

('BEL9', 'Youri Tielemans', '1997-05-07', 176, 72, 'Aston Villa', TRUE, 'https://example.com/tielemans.png', 'BEL', 'Volante'),

('BEL10', 'Amadou Onana', '2001-08-16', 195, 86, 'Aston Villa', TRUE, 'https://example.com/onana.png', 'BEL', 'Volante'),

('BEL11', 'Hans Vanaken', '1992-08-24', 195, 77, 'Club Brugge', FALSE, 'https://example.com/vanaken.png', 'BEL', 'Mediapunta'),

('BEL12', 'Jeremy Doku', '2002-05-27', 173, 67, 'Manchester City', TRUE, 'https://example.com/doku.png', 'BEL', 'Extremo'),

-- Equipo
('BEL13', 'Selección Bélgica 2026', NULL, NULL, NULL, 'Selección Bélgica', TRUE, 'https://example.com/seleccion_belgica_2026.png', 'BEL', 'EQUIPO'),

-- Más jugadores
('BEL14', 'Romelu Lukaku', '1993-05-13', 191, 94, 'AS Roma', TRUE, 'https://example.com/lukaku.png', 'BEL', 'Delantero'),

('BEL15', 'Loïs Openda', '2000-02-16', 177, 75, 'RB Leipzig', TRUE, 'https://example.com/openda.png', 'BEL', 'Delantero'),

('BEL16', 'Dries Mertens', '1987-05-06', 169, 61, 'Galatasaray', FALSE, 'https://example.com/mertens.png', 'BEL', 'Extremo'),

('BEL17', 'Leandro Trossard', '1994-12-04', 172, 61, 'Arsenal', TRUE, 'https://example.com/trossard.png', 'BEL', 'Extremo'),

('BEL18', 'Dodi Lukebakio', '1997-09-24', 187, 77, 'Sevilla', FALSE, 'https://example.com/lukebakio.png', 'BEL', 'Extremo'),

('BEL19', 'Arthur Theate', '2000-05-25', 185, 79, 'Rennes', FALSE, 'https://example.com/theate.png', 'BEL', 'Defensa'),

('BEL20', 'Charles De Ketelaere', '2001-03-10', 192, 74, 'Atalanta', TRUE, 'https://example.com/deketelaere.png', 'BEL', 'Mediapunta');

UPDATE laminas_panini_2026
SET iso3 = 'BEL'
WHERE id like 'BEL%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('EGY1', 'Escudo Selección Egipto', NULL, NULL, NULL, 'Selección Egipto', TRUE, 'https://example.com/egipto_escudo.png', 'EGY', 'ESCUDO'),

-- Jugadores
('EGY2', 'Mohamed El Shenawy', '1988-12-19', 191, 85, 'Al Ahly', TRUE, 'https://example.com/el_shenawy.png', 'EGY', 'Arquero'),

('EGY3', 'Mohamed Abou Gabal', '1989-01-29', 191, 88, 'Zamalek', FALSE, 'https://example.com/abou_gabal.png', 'EGY', 'Arquero'),

('EGY4', 'Ahmed Hegazi', '1991-01-25', 193, 84, 'Al-Ittihad', TRUE, 'https://example.com/hegazi.png', 'EGY', 'Defensa'),

('EGY5', 'Mohamed Abdelmonem', '1999-02-01', 188, 80, 'Al Ahly', TRUE, 'https://example.com/abdelmonem.png', 'EGY', 'Defensa'),

('EGY6', 'Ali Gabr', '1993-07-01', 193, 83, 'Zamalek', FALSE, 'https://example.com/ali_gabr.png', 'EGY', 'Defensa'),

('EGY7', 'Omar Kamal', '1993-04-29', 182, 77, 'Al Ahly', FALSE, 'https://example.com/omar_kamal.png', 'EGY', 'Defensa'),

('EGY8', 'Mohamed Elneny', '1992-07-11', 180, 74, 'Arsenal', TRUE, 'https://example.com/elneny.png', 'EGY', 'Volante'),

('EGY9', 'Hamdi Fathi', '1994-09-29', 182, 78, 'Al Wakrah', TRUE, 'https://example.com/hamdi_fathi.png', 'EGY', 'Volante'),

('EGY10', 'Tarek Hamed', '1988-10-01', 170, 70, 'Al-Ittihad', FALSE, 'https://example.com/tarek_hamed.png', 'EGY', 'Volante'),

('EGY11', 'Ahmed Zizo', '1996-01-10', 175, 72, 'Zamalek', TRUE, 'https://example.com/zizo.png', 'EGY', 'Extremo'),

('EGY12', 'Mohamed Salah', '1992-06-15', 175, 71, 'Liverpool', TRUE, 'https://example.com/salah.png', 'EGY', 'Delantero'),

-- Equipo
('EGY13', 'Selección Egipto 2026', NULL, NULL, NULL, 'Selección Egipto', TRUE, 'https://example.com/seleccion_egipto_2026.png', 'EGY', 'EQUIPO'),

-- Más jugadores
('EGY14', 'Mostafa Mohamed', '1997-11-28', 185, 79, 'Nantes', TRUE, 'https://example.com/mostafa_mohamed.png', 'EGY', 'Delantero'),

('EGY15', 'Marwan Hamdy', '1997-01-15', 192, 86, 'Zamalek', FALSE, 'https://example.com/marwan_hamdy.png', 'EGY', 'Delantero'),

('EGY16', 'Ramadan Sobhi', '1997-01-23', 183, 74, 'Pyramids FC', FALSE, 'https://example.com/ramadan_sobhi.png', 'EGY', 'Extremo'),

('EGY17', 'Ahmed Fatouh', '1998-03-22', 176, 70, 'Zamalek', TRUE, 'https://example.com/ahmed_fatouh.png', 'EGY', 'Defensa'),

('EGY18', 'Mahmoud Trezeguet', '1994-10-01', 179, 75, 'Al Ahly', TRUE, 'https://example.com/trezeguet.png', 'EGY', 'Extremo'),

('EGY19', 'Akram Tawfik', '1997-11-01', 178, 73, 'Al Ahly', FALSE, 'https://example.com/akram_tawfik.png', 'EGY', 'Volante'),

('EGY20', 'Ibrahim Adel', '2001-04-20', 174, 70, 'Pyramids FC', TRUE, 'https://example.com/ibrahim_adel.png', 'EGY', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'EGY'
WHERE id like 'EGY%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('IRN1', 'Escudo Selección Irán', NULL, NULL, NULL, 'Selección Irán', TRUE, 'https://example.com/iran_escudo.png', 'IRN', 'ESCUDO'),

-- Jugadores
('IRN2', 'Alireza Beiranvand', '1992-09-21', 194, 85, 'Persepolis', TRUE, 'https://example.com/beiranvand.png', 'IRN', 'Arquero'),

('IRN3', 'Hossein Hosseini', '1992-06-30', 186, 82, 'Esteghlal', FALSE, 'https://example.com/hosseini.png', 'IRN', 'Arquero'),

('IRN4', 'Ramin Rezaeian', '1990-03-21', 185, 78, 'Esteghlal', TRUE, 'https://example.com/rezaeian.png', 'IRN', 'Defensa'),

('IRN5', 'Milad Mohammadi', '1993-09-29', 178, 73, 'Persepolis', TRUE, 'https://example.com/mohammadi.png', 'IRN', 'Defensa'),

('IRN6', 'Mohammad Hossein Kanaani', '1994-03-23', 185, 80, 'Al Ahli', FALSE, 'https://example.com/kanaani.png', 'IRN', 'Defensa'),

('IRN7', 'Shoja Khalilzadeh', '1989-05-08', 182, 78, 'Tractor SC', TRUE, 'https://example.com/khalilzadeh.png', 'IRN', 'Defensa'),

('IRN8', 'Saeid Ezatolahi', '1996-10-01', 190, 82, 'Al Ahli', TRUE, 'https://example.com/ezatolahi.png', 'IRN', 'Volante'),

('IRN9', 'Saman Ghoddos', '1993-09-06', 176, 74, 'Brentford', TRUE, 'https://example.com/ghoddos.png', 'IRN', 'Volante'),

('IRN10', 'Mehdi Torabi', '1994-09-10', 179, 73, 'Persepolis', TRUE, 'https://example.com/torabi.png', 'IRN', 'Volante'),

('IRN11', 'Alireza Jahanbakhsh', '1993-08-11', 180, 75, 'Heerenveen', TRUE, 'https://example.com/jahanbakhsh.png', 'IRN', 'Extremo'),

('IRN12', 'Mehdi Taremi', '1992-07-18', 187, 80, 'Inter de Milán', TRUE, 'https://example.com/taremi.png', 'IRN', 'Delantero'),

-- Equipo
('IRN13', 'Selección Irán 2026', NULL, NULL, NULL, 'Selección Irán', TRUE, 'https://example.com/seleccion_iran_2026.png', 'IRN', 'EQUIPO'),

-- Más jugadores
('IRN14', 'Sardar Azmoun', '1995-01-01', 186, 80, 'Shabab Al Ahli', TRUE, 'https://example.com/azmoun.png', 'IRN', 'Delantero'),

('IRN15', 'Mehdi Ghayedi', '1998-12-05', 165, 60, 'Ittihad Kalba', FALSE, 'https://example.com/ghayedi.png', 'IRN', 'Extremo'),

('IRN16', 'Mohammad Mohebi', '1998-12-20', 186, 80, 'Rostov', TRUE, 'https://example.com/mohebi.png', 'IRN', 'Extremo'),

('IRN17', 'Karim Ansarifard', '1990-04-03', 187, 80, 'AEK Atenas', FALSE, 'https://example.com/ansarifard.png', 'IRN', 'Delantero'),

('IRN18', 'Allahyar Sayyadmanesh', '2001-06-29', 176, 70, 'Hull City', FALSE, 'https://example.com/sayyadmanesh.png', 'IRN', 'Delantero'),

('IRN19', 'Omid Noorafkan', '1997-04-09', 183, 75, 'Sepahan', FALSE, 'https://example.com/noorafkan.png', 'IRN', 'Volante'),

('IRN20', 'Rouzbeh Cheshmi', '1993-06-24', 186, 80, 'Esteghlal', FALSE, 'https://example.com/cheshmi.png', 'IRN', 'Defensa');

UPDATE laminas_panini_2026
SET iso3 = 'IRN'
WHERE id like 'IRN%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('NZL1', 'Escudo Selección Nueva Zelanda', NULL, NULL, NULL, 'Selección Nueva Zelanda', TRUE, 'https://example.com/nueva_zelanda_escudo.png', 'NZL', 'ESCUDO'),

-- Jugadores
('NZL2', 'Oliver Sail', '1996-01-12', 198, 92, 'Wellington Phoenix', TRUE, 'https://example.com/oliver_sail.png', 'NZL', 'Arquero'),

('NZL3', 'Max Crocombe', '1993-08-12', 193, 88, 'Burton Albion', FALSE, 'https://example.com/crocombe.png', 'NZL', 'Arquero'),

('NZL4', 'Michael Boxall', '1988-08-18', 193, 90, 'Minnesota United', TRUE, 'https://example.com/boxall.png', 'NZL', 'Defensa'),

('NZL5', 'Tommy Smith', '1990-03-31', 188, 82, 'Free Agent', FALSE, 'https://example.com/tommy_smith.png', 'NZL', 'Defensa'),

('NZL6', 'Bill Tuiloma', '1995-03-27', 181, 80, 'Charlotte FC', TRUE, 'https://example.com/tuiloma.png', 'NZL', 'Defensa'),

('NZL7', 'Liberato Cacace', '2000-09-27', 175, 70, 'Empoli', TRUE, 'https://example.com/cacace.png', 'NZL', 'Lateral'),

('NZL8', 'Joe Bell', '1999-04-27', 178, 72, 'Viking FK', TRUE, 'https://example.com/joe_bell.png', 'NZL', 'Volante'),

('NZL9', 'Marko Stamenic', '2002-02-19', 188, 82, 'Red Star Belgrade', TRUE, 'https://example.com/stamenic.png', 'NZL', 'Volante'),

('NZL10', 'Matthew Garbett', '2002-04-13', 180, 73, 'Toulouse', FALSE, 'https://example.com/garbett.png', 'NZL', 'Volante'),

('NZL11', 'Sarpreet Singh', '1999-02-20', 178, 70, 'Hansa Rostock', FALSE, 'https://example.com/singh.png', 'NZL', 'Mediapunta'),

('NZL12', 'Chris Wood', '1991-12-07', 191, 91, 'Nottingham Forest', TRUE, 'https://example.com/chris_wood.png', 'NZL', 'Delantero'),

-- Equipo
('NZL13', 'Selección Nueva Zelanda 2026', NULL, NULL, NULL, 'Selección Nueva Zelanda', TRUE, 'https://example.com/seleccion_nz_2026.png', 'NZL', 'EQUIPO'),

-- Más jugadores
('NZL14', 'Kosta Barbarouses', '1990-02-19', 179, 75, 'Wellington Phoenix', FALSE, 'https://example.com/barbarouses.png', 'NZL', 'Extremo'),

('NZL15', 'Callum McCowatt', '1999-04-30', 178, 72, 'Silkeborg IF', FALSE, 'https://example.com/mccowatt.png', 'NZL', 'Extremo'),

('NZL16', 'Ben Waine', '2001-06-11', 180, 76, 'Plymouth Argyle', FALSE, 'https://example.com/waine.png', 'NZL', 'Delantero'),

('NZL17', 'Ryan Thomas', '1994-08-20', 174, 70, 'PEC Zwolle', FALSE, 'https://example.com/ryan_thomas.png', 'NZL', 'Volante'),

('NZL18', 'Tim Payne', '1994-01-10', 183, 77, 'Wellington Phoenix', FALSE, 'https://example.com/tim_payne.png', 'NZL', 'Defensa'),

('NZL19', 'Finn Surman', '2003-02-26', 193, 84, 'Wellington Phoenix', TRUE, 'https://example.com/surman.png', 'NZL', 'Defensa'),

('NZL20', 'Logan Rogerson', '1998-05-24', 182, 76, 'Viking FK', FALSE, 'https://example.com/rogerson.png', 'NZL', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'NZL'
WHERE id like 'NZL%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('ESP1', 'Escudo Selección España', NULL, NULL, NULL, 'Selección España', TRUE, 'https://example.com/espana_escudo.png', 'ESP', 'ESCUDO'),

-- Jugadores
('ESP2', 'Unai Simón', '1997-06-11', 190, 88, 'Athletic Club', TRUE, 'https://example.com/unai_simon.png', 'ESP', 'Arquero'),

('ESP3', 'David Raya', '1995-09-15', 183, 80, 'Arsenal', TRUE, 'https://example.com/david_raya.png', 'ESP', 'Arquero'),

('ESP4', 'Rodri', '1996-06-22', 191, 82, 'Manchester City', TRUE, 'https://example.com/rodri.png', 'ESP', 'Volante'),

('ESP5', 'Pedri', '2002-11-25', 174, 60, 'Barcelona', TRUE, 'https://example.com/pedri.png', 'ESP', 'Volante'),

('ESP6', 'Gavi', '2004-08-05', 173, 70, 'Barcelona', TRUE, 'https://example.com/gavi.png', 'ESP', 'Volante'),

('ESP7', 'Fabián Ruiz', '1996-04-03', 189, 70, 'PSG', TRUE, 'https://example.com/fabian_ruiz.png', 'ESP', 'Volante'),

('ESP8', 'Dani Carvajal', '1992-01-11', 173, 73, 'Real Madrid', TRUE, 'https://example.com/carvajal.png', 'ESP', 'Defensa'),

('ESP9', 'Aymeric Laporte', '1994-05-27', 191, 85, 'Al Nassr', TRUE, 'https://example.com/laporte.png', 'ESP', 'Defensa'),

('ESP10', 'Robin Le Normand', '1996-11-11', 187, 80, 'Atlético de Madrid', TRUE, 'https://example.com/le_normand.png', 'ESP', 'Defensa'),

('ESP11', 'Alejandro Balde', '2003-10-18', 175, 69, 'Barcelona', TRUE, 'https://example.com/balde.png', 'ESP', 'Defensa'),

('ESP12', 'Nico Williams', '2002-07-12', 181, 67, 'Athletic Club', TRUE, 'https://example.com/nico_williams.png', 'ESP', 'Extremo'),

-- Equipo
('ESP13', 'Selección España 2026', NULL, NULL, NULL, 'Selección España', TRUE, 'https://example.com/seleccion_espana_2026.png', 'ESP', 'EQUIPO'),

-- Más jugadores
('ESP14', 'Lamine Yamal', '2007-07-13', 180, 65, 'Barcelona', TRUE, 'https://example.com/lamine_yamal.png', 'ESP', 'Extremo'),

('ESP15', 'Álvaro Morata', '1992-10-23', 189, 84, 'Atlético de Madrid', TRUE, 'https://example.com/morata.png', 'ESP', 'Delantero'),

('ESP16', 'Mikel Oyarzabal', '1997-04-21', 181, 78, 'Real Sociedad', TRUE, 'https://example.com/oyarzabal.png', 'ESP', 'Delantero'),

('ESP17', 'Dani Olmo', '1998-05-07', 179, 72, 'RB Leipzig', TRUE, 'https://example.com/dani_olmo.png', 'ESP', 'Mediapunta'),

('ESP18', 'Álex Baena', '2001-07-20', 174, 68, 'Villarreal', FALSE, 'https://example.com/baena.png', 'ESP', 'Volante'),

('ESP19', 'Joselu', '1990-03-27', 191, 80, 'Al-Gharafa', FALSE, 'https://example.com/joselu.png', 'ESP', 'Delantero'),

('ESP20', 'Yeremy Pino', '2002-10-20', 172, 65, 'Villarreal', TRUE, 'https://example.com/yeremy_pino.png', 'ESP', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'ESP'
WHERE id like 'ESP%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('CPV1', 'Escudo Selección Cabo Verde', NULL, NULL, NULL, 'Selección Cabo Verde', TRUE, 'https://example.com/cabo_verde_escudo.png', 'CPV', 'ESCUDO'),

-- Jugadores
('CPV2', 'Vozinha', '1989-04-09', 185, 82, 'Casa Pia', TRUE, 'https://example.com/vozinha.png', 'CPV', 'Arquero'),

('CPV3', 'Jorge Teixeira', '1986-08-27', 192, 88, 'Farense', FALSE, 'https://example.com/teixeira.png', 'CPV', 'Defensa'),

('CPV4', 'Stopira', '1988-05-20', 178, 74, 'Fehérvár', TRUE, 'https://example.com/stopira.png', 'CPV', 'Defensa'),

('CPV5', 'Logan Costa', '2001-04-01', 190, 83, 'Villarreal', TRUE, 'https://example.com/logan_costa.png', 'CPV', 'Defensa'),

('CPV6', 'Steven Moreira', '1994-08-14', 180, 75, 'Columbus Crew', TRUE, 'https://example.com/moreira.png', 'CPV', 'Defensa'),

('CPV7', 'Carlos Ponck', '1995-01-13', 186, 80, 'Alanyaspor', FALSE, 'https://example.com/ponck.png', 'CPV', 'Defensa'),

('CPV8', 'Jamiro Monteiro', '1993-11-23', 174, 70, 'Philadelphia Union', TRUE, 'https://example.com/monteiro.png', 'CPV', 'Volante'),

('CPV9', 'Kevin Pina', '1996-09-03', 179, 72, 'Granada', TRUE, 'https://example.com/pina.png', 'CPV', 'Volante'),

('CPV10', 'Telmo Arcanjo', '2001-04-10', 177, 71, 'Vitória Guimarães', FALSE, 'https://example.com/arcanjo.png', 'CPV', 'Extremo'),

('CPV11', 'Nuno Borges', '1999-02-20', 181, 73, 'Marítimo', FALSE, 'https://example.com/nuno_borges.png', 'CPV', 'Extremo'),

('CPV12', 'Ryan Mendes', '1990-01-08', 180, 74, 'Kocaelispor', TRUE, 'https://example.com/ryan_mendes.png', 'CPV', 'Extremo'),

-- Equipo
('CPV13', 'Selección Cabo Verde 2026', NULL, NULL, NULL, 'Selección Cabo Verde', TRUE, 'https://example.com/seleccion_cabo_verde_2026.png', 'CPV', 'EQUIPO'),

-- Más jugadores
('CPV14', 'Bebé', '1990-07-12', 190, 85, 'Rayo Vallecano', TRUE, 'https://example.com/bebe.png', 'CPV', 'Delantero'),

('CPV15', 'Tiquinho Soares', '1991-01-17', 187, 82, 'Botafogo', TRUE, 'https://example.com/tiquinho.png', 'CPV', 'Delantero'),

('CPV16', 'Garfield Silva', '1995-03-22', 176, 70, 'Estoril', FALSE, 'https://example.com/garfield_silva.png', 'CPV', 'Volante'),

('CPV17', 'Lisandro Semedo', '1996-04-12', 175, 69, 'RKC Waalwijk', FALSE, 'https://example.com/semedo.png', 'CPV', 'Extremo'),

('CPV18', 'Garry Rodrigues', '1990-11-27', 173, 68, 'Al-Shamal', TRUE, 'https://example.com/rodrigues.png', 'CPV', 'Extremo'),

('CPV19', 'Willy Semedo', '1994-01-06', 180, 74, 'Omonia Nicosia', FALSE, 'https://example.com/willy_semedo.png', 'CPV', 'Extremo'),

('CPV20', 'João Paulo', '1993-09-14', 182, 76, 'Farense', FALSE, 'https://example.com/joao_paulo.png', 'CPV', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'CPV'
WHERE id like 'CPV%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('KSA1', 'Escudo Selección Arabia Saudita', NULL, NULL, NULL, 'Selección Arabia Saudita', TRUE, 'https://example.com/arabia_saudita_escudo.png', 'KSA', 'ESCUDO'),

-- Jugadores
('KSA2', 'Mohammed Al-Owais', '1991-10-10', 185, 78, 'Al-Hilal', TRUE, 'https://example.com/al_owais.png', 'KSA', 'Arquero'),

('KSA3', 'Nawaf Al-Aqidi', '2000-05-09', 190, 82, 'Al-Nassr', FALSE, 'https://example.com/aqidi.png', 'KSA', 'Arquero'),

('KSA4', 'Ali Al-Bulaihi', '1989-11-21', 182, 77, 'Al-Hilal', TRUE, 'https://example.com/al_bulaihi.png', 'KSA', 'Defensa'),

('KSA5', 'Abdulelah Al-Amri', '1997-01-15', 181, 75, 'Al-Nassr', TRUE, 'https://example.com/al_amri.png', 'KSA', 'Defensa'),

('KSA6', 'Hassan Tambakti', '1999-02-09', 185, 78, 'Al-Hilal', TRUE, 'https://example.com/tambakti.png', 'KSA', 'Defensa'),

('KSA7', 'Yasser Al-Shahrani', '1992-05-25', 165, 66, 'Al-Hilal', FALSE, 'https://example.com/alshahrani.png', 'KSA', 'Defensa'),

('KSA8', 'Salem Al-Dawsari', '1991-08-19', 173, 70, 'Al-Hilal', TRUE, 'https://example.com/dawsari.png', 'KSA', 'Extremo'),

('KSA9', 'Sami Al-Najei', '1997-02-07', 176, 72, 'Al-Nassr', FALSE, 'https://example.com/al_najei.png', 'KSA', 'Volante'),

('KSA10', 'Abdulrahman Ghareeb', '1997-03-31', 170, 68, 'Al-Nassr', TRUE, 'https://example.com/ghareeb.png', 'KSA', 'Extremo'),

('KSA11', 'Mohamed Kanno', '1994-09-22', 192, 84, 'Al-Hilal', TRUE, 'https://example.com/kanno.png', 'KSA', 'Volante'),

('KSA12', 'Firas Al-Buraikan', '2000-05-14', 181, 76, 'Al-Fateh', TRUE, 'https://example.com/al_buraikan.png', 'KSA', 'Delantero'),

-- Equipo
('KSA13', 'Selección Arabia Saudita 2026', NULL, NULL, NULL, 'Selección Arabia Saudita', TRUE, 'https://example.com/seleccion_arabia_saudita_2026.png', 'KSA', 'EQUIPO'),

-- Más jugadores
('KSA14', 'Saleh Al-Shehri', '1993-11-01', 182, 79, 'Al-Hilal', TRUE, 'https://example.com/al_shehri.png', 'KSA', 'Delantero'),

('KSA15', 'Hussein Al-Qahtani', '1996-06-01', 178, 74, 'Al-Ettifaq', FALSE, 'https://example.com/al_qahtani.png', 'KSA', 'Volante'),

('KSA16', 'Nasser Al-Dawsari', '1998-11-19', 174, 70, 'Al-Hilal', TRUE, 'https://example.com/nasser_dawsari.png', 'KSA', 'Volante'),

('KSA17', 'Fahad Al-Muwallad', '1994-09-14', 167, 65, 'Al-Shabab', FALSE, 'https://example.com/al_muwallad.png', 'KSA', 'Extremo'),

('KSA18', 'Mohamed Maran', '1998-02-15', 184, 78, 'Al-Nassr', FALSE, 'https://example.com/maran.png', 'KSA', 'Delantero'),

('KSA19', 'Ziyad Al-Sahafi', '1994-02-17', 180, 75, 'Al-Ittihad', FALSE, 'https://example.com/al_sahafi.png', 'KSA', 'Defensa'),

('KSA20', 'Abdulaziz Al-Bishi', '1994-02-11', 170, 69, 'Al-Fateh', FALSE, 'https://example.com/al_bishi.png', 'KSA', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'KSA'
WHERE id like 'KSA%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('URU1', 'Escudo Selección Uruguay', NULL, NULL, NULL, 'Selección Uruguay', TRUE, 'https://example.com/uruguay_escudo.png', 'URU', 'ESCUDO'),

-- Jugadores
('URU2', 'Sergio Rochet', '1993-03-23', 190, 86, 'Internacional', TRUE, 'https://example.com/rochet.png', 'URU', 'Arquero'),

('URU3', 'Santiago Mele', '1997-09-06', 186, 80, 'Junior', FALSE, 'https://example.com/mele.png', 'URU', 'Arquero'),

('URU4', 'José María Giménez', '1995-01-20', 185, 80, 'Atlético de Madrid', TRUE, 'https://example.com/gimenez.png', 'URU', 'Defensa'),

('URU5', 'Ronald Araújo', '1999-03-07', 188, 79, 'Barcelona', TRUE, 'https://example.com/araujo.png', 'URU', 'Defensa'),

('URU6', 'Sebastián Coates', '1990-10-07', 196, 89, 'Nacional', FALSE, 'https://example.com/coates.png', 'URU', 'Defensa'),

('URU7', 'Mathías Olivera', '1997-10-31', 184, 78, 'Napoli', TRUE, 'https://example.com/olivera.png', 'URU', 'Defensa'),

('URU8', 'Federico Valverde', '1998-07-22', 182, 78, 'Real Madrid', TRUE, 'https://example.com/valverde.png', 'URU', 'Volante'),

('URU9', 'Rodrigo Bentancur', '1997-06-25', 187, 77, 'Tottenham', TRUE, 'https://example.com/bentancur.png', 'URU', 'Volante'),

('URU10', 'Manuel Ugarte', '2001-04-11', 182, 77, 'Manchester United', TRUE, 'https://example.com/ugarte.png', 'URU', 'Volante'),

('URU11', 'Nicolás de la Cruz', '1997-06-01', 167, 65, 'Flamengo', TRUE, 'https://example.com/delacruz.png', 'URU', 'Volante'),

('URU12', 'Facundo Pellistri', '2001-12-20', 175, 70, 'Granada', TRUE, 'https://example.com/pellistri.png', 'URU', 'Extremo'),

-- Equipo
('URU13', 'Selección Uruguay 2026', NULL, NULL, NULL, 'Selección Uruguay', TRUE, 'https://example.com/seleccion_uruguay_2026.png', 'URU', 'EQUIPO'),

-- Más jugadores
('URU14', 'Darwin Núñez', '1999-06-24', 187, 81, 'Liverpool', TRUE, 'https://example.com/nunez.png', 'URU', 'Delantero'),

('URU15', 'Luis Suárez', '1987-01-24', 182, 83, 'Inter Miami', TRUE, 'https://example.com/suarez.png', 'URU', 'Delantero'),

('URU16', 'Edinson Cavani', '1987-02-14', 184, 77, 'Boca Juniors', TRUE, 'https://example.com/cavani.png', 'URU', 'Delantero'),

('URU17', 'Maxi Gómez', '1996-08-14', 186, 85, 'Trabzonspor', FALSE, 'https://example.com/gomez.png', 'URU', 'Delantero'),

('URU18', 'Brian Rodríguez', '2000-05-20', 173, 70, 'América', TRUE, 'https://example.com/brian_rodriguez.png', 'URU', 'Extremo'),

('URU19', 'Giorgian De Arrascaeta', '1994-06-01', 172, 69, 'Flamengo', TRUE, 'https://example.com/arrascaeta.png', 'URU', 'Mediapunta'),

('URU20', 'Agustín Canobbio', '1998-10-01', 176, 72, 'Fluminense', FALSE, 'https://example.com/canobbio.png', 'URU', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'URU'
WHERE id like 'URU%';

INSERT INTO laminas_panini_2026 
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('COL1', 'Escudo Selección Colombia', NULL, NULL, NULL, 'Selección Colombia', TRUE, 'https://example.com/colombia_escudo.png', 'COL', 'ESCUDO'),

-- Jugadores
('COL2', 'Camilo Vargas', '1989-01-09', 185, 79, 'Atlas', FALSE, 'https://example.com/camilo_vargas.png', 'COL', 'Arquero'),

('COL3', 'David Ospina', '1988-08-31', 183, 79, 'Al Nassr', FALSE, 'https://example.com/david_ospina.png', 'COL', 'Arquero'),

('COL4', 'Daniel Muñoz', '1996-05-26', 180, 75, 'Crystal Palace', FALSE, 'https://example.com/daniel_munoz.png', 'COL', 'Defensa'),

('COL5', 'Yerry Mina', '1994-09-23', 195, 94, 'Cagliari', FALSE, 'https://example.com/yerry_mina.png', 'COL', 'Defensa'),

('COL6', 'Jhon Lucumí', '1998-06-26', 187, 78, 'Bologna', FALSE, 'https://example.com/jhon_lucumi.png', 'COL', 'Defensa'),

('COL7', 'Deiver Machado', '1993-09-02', 171, 70, 'Lens', FALSE, 'https://example.com/deiver_machado.png', 'COL', 'Defensa'),

('COL8', 'Jefferson Lerma', '1994-10-25', 179, 70, 'Crystal Palace', FALSE, 'https://example.com/jefferson_lerma.png', 'COL', 'Volante'),

('COL9', 'Richard Ríos', '2000-06-02', 187, 76, 'Palmeiras', FALSE, 'https://example.com/richard_rios.png', 'COL', 'Volante'),

('COL10', 'James Rodríguez', '1991-07-12', 180, 75, 'São Paulo', TRUE, 'https://example.com/james_rodriguez.png', 'COL', 'Volante'),

('COL11', 'Jhon Arias', '1997-09-21', 168, 65, 'Fluminense', FALSE, 'https://example.com/jhon_arias.png', 'COL', 'Extremo'),

('COL12', 'Luis Díaz', '1997-01-13', 180, 73, 'Liverpool', TRUE, 'https://example.com/luis_diaz.png', 'COL', 'Extremo'),

-- Foto del equipo
('COL13', 'Selección Colombia 2026', NULL, NULL, NULL, 'Selección Colombia', TRUE, 'https://example.com/seleccion_colombia_2026.png', 'COL', 'EQUIPO'),

-- Más jugadores
('COL14', 'Rafael Santos Borré', '1995-09-15', 174, 70, 'Internacional', FALSE, 'https://example.com/santos_borre.png', 'COL', 'Delantero'),

('COL15', 'Jhon Córdoba', '1993-05-11', 188, 84, 'Krasnodar', FALSE, 'https://example.com/jhon_cordoba.png', 'COL', 'Delantero'),

('COL16', 'Mateus Uribe', '1991-03-21', 182, 71, 'Al Sadd', FALSE, 'https://example.com/mateus_uribe.png', 'COL', 'Volante'),

('COL17', 'Juan Fernando Quintero', '1993-01-18', 168, 64, 'Racing Club', FALSE, 'https://example.com/quintero.png', 'COL', 'Volante'),

('COL18', 'Davinson Sánchez', '1996-06-12', 187, 81, 'Galatasaray', FALSE, 'https://example.com/davinson_sanchez.png', 'COL', 'Defensa'),

('COL19', 'Jorge Carrascal', '1998-05-25', 179, 70, 'Dynamo Moscow', FALSE, 'https://example.com/jorge_carrascal.png', 'COL', 'Volante'),

('COL20', 'Kevin Castaño', '2000-09-29', 177, 73, 'Krasnodar', FALSE, 'https://example.com/kevin_castano.png', 'COL', 'Volante');
UPDATE laminas_panini_2026
SET iso3 = 'COL'
WHERE id like 'COL%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('POR1', 'Escudo Selección Portugal', NULL, NULL, NULL, 'Selección Portugal', TRUE, 'https://example.com/portugal_escudo.png', 'POR', 'ESCUDO'),

-- Jugadores
('POR2', 'Diogo Costa', '1999-09-19', 187, 82, 'Porto', TRUE, 'https://example.com/diogo_costa.png', 'POR', 'Arquero'),

('POR3', 'Rui Patrício', '1988-02-15', 190, 84, 'Atalanta', FALSE, 'https://example.com/rui_patricio.png', 'POR', 'Arquero'),

('POR4', 'Rúben Dias', '1997-05-14', 187, 82, 'Manchester City', TRUE, 'https://example.com/ruben_dias.png', 'POR', 'Defensa'),

('POR5', 'Pepe', '1983-02-26', 188, 81, 'Porto', TRUE, 'https://example.com/pepe.png', 'POR', 'Defensa'),

('POR6', 'João Cancelo', '1994-05-27', 182, 74, 'Al Hilal', TRUE, 'https://example.com/cancelo.png', 'POR', 'Defensa'),

('POR7', 'Nuno Mendes', '2002-06-19', 180, 73, 'PSG', TRUE, 'https://example.com/nuno_mendes.png', 'POR', 'Defensa'),

('POR8', 'Bruno Fernandes', '1994-09-08', 179, 75, 'Manchester United', TRUE, 'https://example.com/bruno_fernandes.png', 'POR', 'Volante'),

('POR9', 'Bernardo Silva', '1994-08-10', 173, 64, 'Manchester City', TRUE, 'https://example.com/bernardo_silva.png', 'POR', 'Volante'),

('POR10', 'Rúben Neves', '1997-03-13', 180, 74, 'Al Hilal', TRUE, 'https://example.com/ruben_neves.png', 'POR', 'Volante'),

('POR11', 'Vitinha', '2000-02-13', 172, 64, 'PSG', TRUE, 'https://example.com/vitinha.png', 'POR', 'Volante'),

('POR12', 'João Félix', '1999-11-10', 181, 70, 'Barcelona', TRUE, 'https://example.com/joao_felix.png', 'POR', 'Delantero'),

-- Equipo
('POR13', 'Selección Portugal 2026', NULL, NULL, NULL, 'Selección Portugal', TRUE, 'https://example.com/seleccion_portugal_2026.png', 'POR', 'EQUIPO'),

-- Más jugadores
('POR14', 'Cristiano Ronaldo', '1985-02-05', 187, 83, 'Al Nassr', TRUE, 'https://example.com/cristiano_ronaldo.png', 'POR', 'Delantero'),

('POR15', 'Rafael Leão', '1999-06-10', 188, 81, 'AC Milan', TRUE, 'https://example.com/rafael_leao.png', 'POR', 'Extremo'),

('POR16', 'Gonçalo Ramos', '2001-06-20', 185, 79, 'PSG', TRUE, 'https://example.com/goncalo_ramos.png', 'POR', 'Delantero'),

('POR17', 'Diogo Jota', '1996-12-04', 178, 73, 'Liverpool', TRUE, 'https://example.com/diogo_jota.png', 'POR', 'Delantero'),

('POR18', 'Pedro Neto', '2000-03-09', 172, 65, 'Wolverhampton', TRUE, 'https://example.com/pedro_neto.png', 'POR', 'Extremo'),

('POR19', 'Otávio', '1995-02-09', 172, 65, 'Al Nassr', FALSE, 'https://example.com/otavio.png', 'POR', 'Volante'),

('POR20', 'António Silva', '2003-10-30', 187, 80, 'Benfica', TRUE, 'https://example.com/antonio_silva.png', 'POR', 'Defensa');

UPDATE laminas_panini_2026
SET iso3 = 'POR'
WHERE id like 'POR%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('UZB1', 'Escudo Selección Uzbekistán', NULL, NULL, NULL, 'Selección Uzbekistán', TRUE, 'https://example.com/uzbekistan_escudo.png', 'UZB', 'ESCUDO'),

-- Jugadores
('UZB2', 'Utkir Yusupov', '1991-04-23', 188, 82, 'Pakhtakor', TRUE, 'https://example.com/yusupov.png', 'UZB', 'Arquero'),

('UZB3', 'Abduvohid Nematov', '2001-03-24', 185, 78, 'Nasaf', FALSE, 'https://example.com/nematov.png', 'UZB', 'Arquero'),

('UZB4', 'Eldor Shomurodov', '1995-06-29', 190, 83, 'Roma', TRUE, 'https://example.com/shomurodov.png', 'UZB', 'Delantero'),

('UZB5', 'Otabek Shukurov', '1996-06-22', 182, 77, 'Al Fayha', TRUE, 'https://example.com/shukurov.png', 'UZB', 'Volante'),

('UZB6', 'Odiljon Hamrobekov', '1996-05-13', 178, 74, 'Pakhtakor', FALSE, 'https://example.com/hamrobekov.png', 'UZB', 'Volante'),

('UZB7', 'Sardor Rashidov', '1991-06-14', 180, 75, 'Qizilqum', TRUE, 'https://example.com/rashidov.png', 'UZB', 'Extremo'),

('UZB8', 'Ibrokhimhalil Yuldoshev', '2001-02-01', 179, 73, 'Navbahor', TRUE, 'https://example.com/yuldoshev.png', 'UZB', 'Defensa'),

('UZB9', 'Rustam Ashurmatov', '1996-07-07', 185, 80, 'Rubin Kazan', TRUE, 'https://example.com/ashurmatov.png', 'UZB', 'Defensa'),

('UZB10', 'Hojimat Erkinov', '2001-05-29', 175, 70, 'CSKA Moscú', TRUE, 'https://example.com/erkinov.png', 'UZB', 'Extremo'),

('UZB11', 'Jaloliddin Masharipov', '1993-09-01', 177, 72, 'Persepolis', TRUE, 'https://example.com/masharipov.png', 'UZB', 'Extremo'),

('UZB12', 'Igor Sergeev', '1993-04-30', 187, 81, 'Pakhtakor', FALSE, 'https://example.com/sergeev.png', 'UZB', 'Delantero'),

-- Equipo
('UZB13', 'Selección Uzbekistán 2026', NULL, NULL, NULL, 'Selección Uzbekistán', TRUE, 'https://example.com/seleccion_uzbekistan_2026.png', 'UZB', 'EQUIPO'),

-- Más jugadores
('UZB14', 'Shahzodbek Nazarov', '1999-01-15', 180, 75, 'Bunyodkor', FALSE, 'https://example.com/nazarov.png', 'UZB', 'Volante'),

('UZB15', 'Anvar Khojimirzaev', '1997-02-21', 176, 72, 'Pakhtakor', FALSE, 'https://example.com/khojimirzaev.png', 'UZB', 'Extremo'),

('UZB16', 'Farrukh Sayfiev', '1994-04-17', 174, 70, 'Pakhtakor', TRUE, 'https://example.com/sayfiev.png', 'UZB', 'Defensa'),

('UZB17', 'Khusniddin Alikulov', '1998-04-04', 186, 80, 'Nasaf', FALSE, 'https://example.com/alikulov.png', 'UZB', 'Defensa'),

('UZB18', 'Bobur Abdikholikov', '1997-06-02', 184, 78, 'Neftchi', TRUE, 'https://example.com/abdikholikov.png', 'UZB', 'Delantero'),

('UZB19', 'Ruslanbek Jiyanov', '2003-02-05', 176, 71, 'Olympic Tashkent', FALSE, 'https://example.com/jiyanov.png', 'UZB', 'Volante'),

('UZB20', 'Zafarmurod Abdirahmatov', '2000-08-12', 181, 76, 'Bunyodkor', FALSE, 'https://example.com/abdirahmatov.png', 'UZB', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'UZB'
WHERE id like 'UZB%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('COD1', 'Escudo Selección RD Congo', NULL, NULL, NULL, 'Selección RD Congo', TRUE, 'https://example.com/rd_congo_escudo.png', 'COD', 'ESCUDO'),

-- Jugadores
('COD2', 'Lionel Mpasi', '1994-02-01', 185, 82, 'Toulouse', TRUE, 'https://example.com/mpasi.png', 'COD', 'Arquero'),

('COD3', 'Fabrice Ondoa', '1995-12-24', 190, 84, 'Nîmes', FALSE, 'https://example.com/ondoa.png', 'COD', 'Arquero'),

('COD4', 'Chancel Mbemba', '1994-08-08', 182, 80, 'Marseille', TRUE, 'https://example.com/mbemba.png', 'COD', 'Defensa'),

('COD5', 'Glody Ngonda', '1994-11-27', 175, 72, 'Dinamo București', FALSE, 'https://example.com/ngonda.png', 'COD', 'Defensa'),

('COD6', 'Arthur Masuaku', '1993-11-07', 179, 73, 'Besiktas', TRUE, 'https://example.com/masuaku.png', 'COD', 'Defensa'),

('COD7', 'Dieumerci Mbokani', '1985-11-22', 185, 84, 'Libre', FALSE, 'https://example.com/mbokani.png', 'COD', 'Delantero'),

('COD8', 'Yoane Wissa', '1996-09-03', 176, 72, 'Brentford', TRUE, 'https://example.com/wissa.png', 'COD', 'Delantero'),

('COD9', 'Cédric Bakambu', '1991-04-11', 182, 78, 'Galatasaray', TRUE, 'https://example.com/bakambu.png', 'COD', 'Delantero'),

('COD10', 'Charles Pickel', '1997-05-15', 188, 80, 'Cremonese', FALSE, 'https://example.com/pickel.png', 'COD', 'Volante'),

('COD11', 'Meschack Elia', '1997-08-06', 175, 70, 'Young Boys', TRUE, 'https://example.com/elia.png', 'COD', 'Extremo'),

('COD12', 'Jordan Botaka', '1993-06-24', 178, 73, 'Sint-Truiden', FALSE, 'https://example.com/botaka.png', 'COD', 'Extremo'),

-- Equipo
('COD13', 'Selección RD Congo 2026', NULL, NULL, NULL, 'Selección RD Congo', TRUE, 'https://example.com/seleccion_rd_congo_2026.png', 'COD', 'EQUIPO'),

-- Más jugadores
('COD14', 'Samuel Essende', '1998-01-23', 189, 84, 'Augsburg', TRUE, 'https://example.com/essende.png', 'COD', 'Delantero'),

('COD15', 'Noah Sadiki', '2004-12-17', 180, 74, 'Union Saint-Gilloise', TRUE, 'https://example.com/sadiki.png', 'COD', 'Volante'),

('COD16', 'Grady Diangana', '1998-04-19', 180, 72, 'West Bromwich', FALSE, 'https://example.com/diangana.png', 'COD', 'Extremo'),

('COD17', 'Inonga Baka', '1994-04-20', 185, 80, 'Young Africans', FALSE, 'https://example.com/inonga.png', 'COD', 'Defensa'),

('COD18', 'Steve Kapuadi', '1998-02-28', 191, 83, 'Warta Poznań', FALSE, 'https://example.com/kapuadi.png', 'COD', 'Defensa'),

('COD19', 'Jackson Muleka', '1999-10-06', 180, 76, 'Al-Kholood', TRUE, 'https://example.com/muleka.png', 'COD', 'Delantero'),

('COD20', 'Ben Malango', '1993-11-10', 185, 82, 'Al Sharjah', FALSE, 'https://example.com/malango.png', 'COD', 'Delantero');



UPDATE laminas_panini_2026
SET iso3 = 'COD'
WHERE id like 'COD%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('FRA1', 'Escudo Selección Francia', NULL, NULL, NULL, 'Selección Francia', TRUE, 'https://example.com/francia_escudo.png', 'FRA', 'ESCUDO'),

-- Jugadores
('FRA2', 'Mike Maignan', '1995-07-03', 191, 89, 'AC Milan', TRUE, 'https://example.com/maignan.png', 'FRA', 'Arquero'),
('FRA3', 'Alphonse Areola', '1993-02-27', 195, 94, 'West Ham', FALSE, 'https://example.com/areola.png', 'FRA', 'Arquero'),

('FRA4', 'William Saliba', '2001-03-24', 192, 83, 'Arsenal', TRUE, 'https://example.com/saliba.png', 'FRA', 'Defensa'),
('FRA5', 'Ibrahima Konaté', '1999-05-25', 194, 95, 'Liverpool', TRUE, 'https://example.com/konate.png', 'FRA', 'Defensa'),
('FRA6', 'Dayot Upamecano', '1998-10-27', 186, 83, 'Bayern Múnich', TRUE, 'https://example.com/upamecano.png', 'FRA', 'Defensa'),
('FRA7', 'Jules Koundé', '1998-11-12', 180, 75, 'Barcelona', TRUE, 'https://example.com/kounde.png', 'FRA', 'Defensa'),
('FRA8', 'Theo Hernández', '1997-10-06', 184, 81, 'AC Milan', TRUE, 'https://example.com/theo_hernandez.png', 'FRA', 'Defensa'),

('FRA9', 'Aurélien Tchouaméni', '2000-01-27', 187, 81, 'Real Madrid', TRUE, 'https://example.com/tchouameni.png', 'FRA', 'Volante'),
('FRA10', 'Eduardo Camavinga', '2002-11-10', 182, 68, 'Real Madrid', TRUE, 'https://example.com/camavinga.png', 'FRA', 'Volante'),
('FRA11', 'Adrien Rabiot', '1995-04-03', 188, 71, 'Marseille', TRUE, 'https://example.com/rabiot.png', 'FRA', 'Volante'),
('FRA12', 'Antoine Griezmann', '1991-03-21', 176, 73, 'Atlético de Madrid', TRUE, 'https://example.com/griezmann.png', 'FRA', 'Mediapunta'),

-- Equipo
('FRA13', 'Selección Francia 2026', NULL, NULL, NULL, 'Selección Francia', TRUE, 'https://example.com/seleccion_francia_2026.png', 'FRA', 'EQUIPO'),

-- Ataque
('FRA14', 'Kylian Mbappé', '1998-12-20', 178, 75, 'Real Madrid', TRUE, 'https://example.com/mbappe.png', 'FRA', 'Delantero'),
('FRA15', 'Ousmane Dembélé', '1997-05-15', 178, 67, 'PSG', TRUE, 'https://example.com/dembele.png', 'FRA', 'Extremo'),
('FRA16', 'Randal Kolo Muani', '1998-12-05', 187, 83, 'PSG', TRUE, 'https://example.com/kolo_muani.png', 'FRA', 'Delantero'),
('FRA17', 'Marcus Thuram', '1997-08-06', 192, 90, 'Inter de Milán', TRUE, 'https://example.com/thuram.png', 'FRA', 'Delantero'),
('FRA18', 'Olivier Giroud', '1986-09-30', 193, 91, 'Los Angeles FC', TRUE, 'https://example.com/giroud.png', 'FRA', 'Delantero'),
('FRA19', 'Kingsley Coman', '1996-06-13', 179, 75, 'Bayern Múnich', TRUE, 'https://example.com/coman.png', 'FRA', 'Extremo'),
('FRA20', 'Bradley Barcola', '2002-09-02', 182, 70, 'PSG', TRUE, 'https://example.com/barcola.png', 'FRA', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'FRA'
WHERE id like 'FRA%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('SEN1', 'Escudo Selección Senegal', NULL, NULL, NULL, 'Selección Senegal', TRUE, 'https://example.com/senegal_escudo.png', 'SEN', 'ESCUDO'),

-- Jugadores
('SEN2', 'Édouard Mendy', '1992-03-01', 197, 86, 'Al Ahli', TRUE, 'https://example.com/mendy.png', 'SEN', 'Arquero'),

('SEN3', 'Alfred Gomis', '1993-09-05', 196, 89, 'Rennes', FALSE, 'https://example.com/gomis.png', 'SEN', 'Arquero'),

('SEN4', 'Kalidou Koulibaly', '1991-06-20', 187, 89, 'Al Hilal', TRUE, 'https://example.com/koulibaly.png', 'SEN', 'Defensa'),

('SEN5', 'Abdou Diallo', '1996-05-04', 187, 84, 'Al Arabi', TRUE, 'https://example.com/diallo.png', 'SEN', 'Defensa'),

('SEN6', 'Ismail Jakobs', '1999-08-17', 184, 78, 'Monaco', FALSE, 'https://example.com/jakobs.png', 'SEN', 'Defensa'),

('SEN7', 'Youssouf Sabaly', '1993-03-05', 174, 72, 'Real Betis', TRUE, 'https://example.com/sabaly.png', 'SEN', 'Defensa'),

('SEN8', 'Idrissa Gana Gueye', '1989-09-26', 174, 66, 'Everton', TRUE, 'https://example.com/gueye.png', 'SEN', 'Volante'),

('SEN9', 'Nampalys Mendy', '1992-06-23', 167, 66, 'Lens', FALSE, 'https://example.com/mendy_volante.png', 'SEN', 'Volante'),

('SEN10', 'Pape Gueye', '1999-01-24', 189, 76, 'Villarreal', TRUE, 'https://example.com/pape_gueye.png', 'SEN', 'Volante'),

('SEN11', 'Krépin Diatta', '1999-02-25', 175, 70, 'Monaco', TRUE, 'https://example.com/diatta.png', 'SEN', 'Extremo'),

('SEN12', 'Ismaïla Sarr', '1998-02-25', 185, 76, 'Crystal Palace', TRUE, 'https://example.com/sarr.png', 'SEN', 'Extremo'),

-- Equipo
('SEN13', 'Selección Senegal 2026', NULL, NULL, NULL, 'Selección Senegal', TRUE, 'https://example.com/seleccion_senegal_2026.png', 'SEN', 'EQUIPO'),

-- Más jugadores
('SEN14', 'Sadio Mané', '1992-04-10', 175, 69, 'Al Nassr', TRUE, 'https://example.com/mane.png', 'SEN', 'Delantero'),

('SEN15', 'Boulaye Dia', '1996-11-16', 180, 75, 'Salernitana', TRUE, 'https://example.com/dia.png', 'SEN', 'Delantero'),

('SEN16', 'Habib Diallo', '1995-06-18', 187, 80, 'Al Shabab', TRUE, 'https://example.com/habib_diallo.png', 'SEN', 'Delantero'),

('SEN17', 'Bamba Dieng', '2000-03-23', 178, 70, 'Lorient', FALSE, 'https://example.com/dieng.png', 'SEN', 'Delantero'),

('SEN18', 'Pape Matar Sarr', '2002-09-14', 184, 76, 'Tottenham', TRUE, 'https://example.com/pape_matar_sarr.png', 'SEN', 'Volante'),

('SEN19', 'Lamine Camara', '2004-01-01', 177, 71, 'Metz', TRUE, 'https://example.com/camara.png', 'SEN', 'Volante'),

('SEN20', 'Nicolas Jackson', '2001-06-20', 186, 78, 'Chelsea', TRUE, 'https://example.com/jackson.png', 'SEN', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'SEN'
WHERE id like 'SEN%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('IRQ1', 'Escudo Selección Irak', NULL, NULL, NULL, 'Selección Irak', TRUE, 'https://example.com/iraq_escudo.png', 'IRQ', 'ESCUDO'),

-- Jugadores
('IRQ2', 'Jalal Hassan', '1991-05-28', 188, 83, 'Al-Zawraa', TRUE, 'https://example.com/jalal_hassan.png', 'IRQ', 'Arquero'),

('IRQ3', 'Mohammed Hameed', '1993-09-10', 186, 80, 'Al-Shorta', FALSE, 'https://example.com/mohammed_hameed.png', 'IRQ', 'Arquero'),

('IRQ4', 'Ali Adnan', '1993-12-19', 185, 78, 'Rizespor', TRUE, 'https://example.com/ali_adnan.png', 'IRQ', 'Defensa'),

('IRQ5', 'Ahmed Ibrahim', '1996-03-01', 182, 76, 'Al-Quwa Al-Jawiya', FALSE, 'https://example.com/ahmed_ibrahim.png', 'IRQ', 'Defensa'),

('IRQ6', 'Frans Putros', '1993-07-10', 184, 80, 'Pafos FC', TRUE, 'https://example.com/frans_putros.png', 'IRQ', 'Defensa'),

('IRQ7', 'Zaid Tahseen', '2000-02-24', 180, 74, 'Al-Shorta', FALSE, 'https://example.com/zaid_tahseen.png', 'IRQ', 'Defensa'),

('IRQ8', 'Amjad Attwan', '1997-03-12', 175, 72, 'Al-Quwa Al-Jawiya', TRUE, 'https://example.com/amjad_attwan.png', 'IRQ', 'Volante'),

('IRQ9', 'Hussein Ali', '2000-06-01', 178, 73, 'Heerenveen', TRUE, 'https://example.com/hussein_ali.png', 'IRQ', 'Volante'),

('IRQ10', 'Safaa Hadi', '1998-05-10', 177, 71, 'Al-Naft', FALSE, 'https://example.com/safaa_hadi.png', 'IRQ', 'Volante'),

('IRQ11', 'Mohannad Ali', '2000-06-20', 183, 77, 'Al-Shorta', TRUE, 'https://example.com/mohannad_ali.png', 'IRQ', 'Delantero'),

('IRQ12', 'Ayman Hussein', '1996-03-22', 190, 85, 'Al-Quwa Al-Jawiya', TRUE, 'https://example.com/ayman_hussein.png', 'IRQ', 'Delantero'),

-- Equipo
('IRQ13', 'Selección Irak 2026', NULL, NULL, NULL, 'Selección Irak', TRUE, 'https://example.com/seleccion_irak_2026.png', 'IRQ', 'EQUIPO'),

-- Más jugadores
('IRQ14', 'Mohammed Qasim', '1996-07-15', 176, 70, 'Al-Zawraa', FALSE, 'https://example.com/mohammed_qasim.png', 'IRQ', 'Extremo'),

('IRQ15', 'Ibrahim Bayesh', '2000-05-01', 173, 69, 'Al-Shorta', TRUE, 'https://example.com/ibrahim_bayesh.png', 'IRQ', 'Volante'),

('IRQ16', 'Youssef Amyn', '2003-12-04', 180, 72, 'Eintracht Frankfurt', TRUE, 'https://example.com/youssef_amyn.png', 'IRQ', 'Extremo'),

('IRQ17', 'Osama Rashid', '1992-01-13', 179, 73, 'Santa Clara', FALSE, 'https://example.com/osama_rashid.png', 'IRQ', 'Volante'),

('IRQ18', 'Humam Tariq', '1996-02-10', 170, 68, 'Al-Shorta', FALSE, 'https://example.com/humam_tariq.png', 'IRQ', 'Extremo'),

('IRQ19', 'Ali Jasim', '2004-01-20', 174, 70, 'Al-Kahrabaa', TRUE, 'https://example.com/ali_jasim.png', 'IRQ', 'Extremo'),

('IRQ20', 'Mohanad Abdul-Raheem', '1993-03-23', 182, 76, 'Al-Shorta', FALSE, 'https://example.com/mohanad_abdulraheem.png', 'IRQ', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'IRQ'
WHERE id like 'IRQ%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('NOR1', 'Escudo Selección Noruega', NULL, NULL, NULL, 'Selección Noruega', TRUE, 'https://example.com/noruega_escudo.png', 'NOR', 'ESCUDO'),

-- Jugadores
('NOR2', 'Ørjan Nyland', '1990-09-10', 192, 93, 'Sevilla', TRUE, 'https://example.com/nyland.png', 'NOR', 'Arquero'),

('NOR3', 'André Hansen', '1989-12-17', 192, 88, 'Rosenborg', FALSE, 'https://example.com/hansen.png', 'NOR', 'Arquero'),

('NOR4', 'Kristoffer Ajer', '1998-04-17', 198, 92, 'Brentford', TRUE, 'https://example.com/ajer.png', 'NOR', 'Defensa'),

('NOR5', 'Leo Østigård', '1999-11-28', 183, 80, 'Genoa', TRUE, 'https://example.com/ostigard.png', 'NOR', 'Defensa'),

('NOR6', 'Torbjørn Heggem', '1999-01-12', 187, 82, 'West Bromwich', FALSE, 'https://example.com/heggem.png', 'NOR', 'Defensa'),

('NOR7', 'Julian Ryerson', '1997-11-17', 183, 79, 'Borussia Dortmund', TRUE, 'https://example.com/ryerson.png', 'NOR', 'Defensa'),

('NOR8', 'Martin Ødegaard', '1998-12-17', 178, 74, 'Arsenal', TRUE, 'https://example.com/odegaard.png', 'NOR', 'Volante'),

('NOR9', 'Sander Berge', '1998-02-14', 195, 88, 'Burnley', TRUE, 'https://example.com/berge.png', 'NOR', 'Volante'),

('NOR10', 'Patrick Berg', '1997-11-24', 180, 74, 'Bodø/Glimt', FALSE, 'https://example.com/patrick_berg.png', 'NOR', 'Volante'),

('NOR11', 'Morten Thorsby', '1996-05-05', 189, 80, 'Genoa', FALSE, 'https://example.com/thorsby.png', 'NOR', 'Volante'),

('NOR12', 'Alexander Sørloth', '1995-12-05', 195, 94, 'Atlético de Madrid', TRUE, 'https://example.com/sorloth.png', 'NOR', 'Delantero'),

-- Equipo
('NOR13', 'Selección Noruega 2026', NULL, NULL, NULL, 'Selección Noruega', TRUE, 'https://example.com/seleccion_noruega_2026.png', 'NOR', 'EQUIPO'),

-- Más jugadores
('NOR14', 'Erling Haaland', '2000-07-21', 194, 88, 'Manchester City', TRUE, 'https://example.com/haaland.png', 'NOR', 'Delantero'),

('NOR15', 'Jørgen Strand Larsen', '2000-02-06', 193, 86, 'Wolverhampton', TRUE, 'https://example.com/strand_larsen.png', 'NOR', 'Delantero'),

('NOR16', 'Antonio Nusa', '2005-04-17', 178, 70, 'RB Leipzig', TRUE, 'https://example.com/nusa.png', 'NOR', 'Extremo'),

('NOR17', 'Oscar Bobb', '2003-07-12', 175, 68, 'Manchester City', TRUE, 'https://example.com/bobb.png', 'NOR', 'Extremo'),

('NOR18', 'Kristian Thorstvedt', '1999-03-13', 189, 80, 'Sassuolo', FALSE, 'https://example.com/thorstvedt.png', 'NOR', 'Volante'),

('NOR19', 'Fredrik Aursnes', '1995-12-10', 179, 72, 'Benfica', FALSE, 'https://example.com/aursnes.png', 'NOR', 'Volante'),

('NOR20', 'Andreas Schjelderup', '2004-06-01', 176, 70, 'Benfica', TRUE, 'https://example.com/schjelderup.png', 'NOR', 'Extremo');

UPDATE laminas_panini_2026
SET iso3 = 'NOR'
WHERE id like 'NOR%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('ARG1', 'Escudo Selección Argentina', NULL, NULL, NULL, 'Selección Argentina', TRUE, 'https://example.com/argentina_escudo.png', 'ARG', 'ESCUDO'),

-- Jugadores
('ARG2', 'Emiliano Martínez', '1992-09-02', 195, 88, 'Aston Villa', TRUE, 'https://example.com/emiliano_martinez.png', 'ARG', 'Arquero'),

('ARG3', 'Gerónimo Rulli', '1992-05-20', 189, 84, 'Ajax', FALSE, 'https://example.com/geronimo_rulli.png', 'ARG', 'Arquero'),

('ARG4', 'Nahuel Molina', '1998-04-06', 175, 70, 'Atlético de Madrid', FALSE, 'https://example.com/nahuel_molina.png', 'ARG', 'Defensa'),

('ARG5', 'Cristian Romero', '1998-04-27', 185, 79, 'Tottenham Hotspur', TRUE, 'https://example.com/cristian_romero.png', 'ARG', 'Defensa'),

('ARG6', 'Lisandro Martínez', '1998-01-18', 175, 77, 'Manchester United', FALSE, 'https://example.com/lisandro_martinez.png', 'ARG', 'Defensa'),

('ARG7', 'Nicolás Tagliafico', '1992-08-31', 172, 65, 'Olympique Lyon', FALSE, 'https://example.com/tagliafico.png', 'ARG', 'Defensa'),

('ARG8', 'Rodrigo De Paul', '1994-05-24', 180, 70, 'Atlético de Madrid', FALSE, 'https://example.com/rodrigo_de_paul.png', 'ARG', 'Volante'),

('ARG9', 'Enzo Fernández', '2001-01-17', 178, 76, 'Chelsea', TRUE, 'https://example.com/enzo_fernandez.png', 'ARG', 'Volante'),

('ARG10', 'Alexis Mac Allister', '1998-12-24', 176, 72, 'Liverpool', FALSE, 'https://example.com/mac_allister.png', 'ARG', 'Volante'),

('ARG11', 'Ángel Di María', '1988-02-14', 180, 75, 'Benfica', TRUE, 'https://example.com/di_maria.png', 'ARG', 'Extremo'),

('ARG12', 'Lionel Messi', '1987-06-24', 170, 72, 'Inter Miami', TRUE, 'https://example.com/lionel_messi.png', 'ARG', 'Delantero'),

-- Foto del equipo
('ARG13', 'Selección Argentina 2026', NULL, NULL, NULL, 'Selección Argentina', TRUE, 'https://example.com/seleccion_argentina_2026.png', 'ARG', 'EQUIPO'),

-- Más jugadores
('ARG14', 'Julián Álvarez', '2000-01-31', 170, 71, 'Manchester City', TRUE, 'https://example.com/julian_alvarez.png', 'ARG', 'Delantero'),

('ARG15', 'Lautaro Martínez', '1997-08-22', 174, 72, 'Inter de Milán', TRUE, 'https://example.com/lautaro_martinez.png', 'ARG', 'Delantero'),

('ARG16', 'Leandro Paredes', '1994-06-29', 180, 75, 'Roma', FALSE, 'https://example.com/paredes.png', 'ARG', 'Volante'),

('ARG17', 'Exequiel Palacios', '1998-10-05', 177, 70, 'Bayer Leverkusen', FALSE, 'https://example.com/palacios.png', 'ARG', 'Volante'),

('ARG18', 'Gonzalo Montiel', '1997-01-01', 175, 73, 'Nottingham Forest', FALSE, 'https://example.com/montiel.png', 'ARG', 'Defensa'),

('ARG19', 'Nicolás Otamendi', '1988-02-12', 183, 81, 'Benfica', FALSE, 'https://example.com/otamendi.png', 'ARG', 'Defensa'),

('ARG20', 'Paulo Dybala', '1993-11-15', 177, 75, 'Roma', TRUE, 'https://example.com/dybala.png', 'ARG', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'ARG'
WHERE id like 'ARG%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('ALG1', 'Escudo Selección Argelia', NULL, NULL, NULL, 'Selección Argelia', TRUE, 'https://example.com/argelia_escudo.png', 'ALG', 'ESCUDO'),

-- Jugadores
('ALG2', 'Anthony Mandrea', '1996-12-25', 187, 82, 'Caen', TRUE, 'https://example.com/mandrea.png', 'ALG', 'Arquero'),

('ALG3', 'Alexandre Oukidja', '1988-07-19', 184, 79, 'Metz', FALSE, 'https://example.com/oukidja.png', 'ALG', 'Arquero'),

('ALG4', 'Ramy Bensebaini', '1995-04-16', 187, 82, 'Borussia Dortmund', TRUE, 'https://example.com/bensebaini.png', 'ALG', 'Defensa'),

('ALG5', 'Aïssa Mandi', '1991-10-22', 184, 78, 'Villarreal', TRUE, 'https://example.com/mandi.png', 'ALG', 'Defensa'),

('ALG6', 'Mohamed Amine Tougaï', '1999-01-22', 187, 80, 'Espérance de Tunis', FALSE, 'https://example.com/tougai.png', 'ALG', 'Defensa'),

('ALG7', 'Youcef Atal', '1996-05-17', 176, 70, 'Adana Demirspor', TRUE, 'https://example.com/atal.png', 'ALG', 'Defensa'),

('ALG8', 'Ismaël Bennacer', '1997-12-01', 175, 70, 'AC Milan', TRUE, 'https://example.com/bennacer.png', 'ALG', 'Volante'),

('ALG9', 'Ramiz Zerrouki', '1998-05-26', 185, 75, 'Feyenoord', TRUE, 'https://example.com/zerrouki.png', 'ALG', 'Volante'),

('ALG10', 'Hicham Boudaoui', '1999-09-23', 180, 72, 'Nice', TRUE, 'https://example.com/boudaoui.png', 'ALG', 'Volante'),

('ALG11', 'Sofiane Feghouli', '1989-12-26', 178, 74, 'Fatih Karagümrük', FALSE, 'https://example.com/feghouli.png', 'ALG', 'Extremo'),

('ALG12', 'Riyad Mahrez', '1991-02-21', 179, 72, 'Al Ahli', TRUE, 'https://example.com/mahrez.png', 'ALG', 'Extremo'),

-- Equipo
('ALG13', 'Selección Argelia 2026', NULL, NULL, NULL, 'Selección Argelia', TRUE, 'https://example.com/seleccion_argelia_2026.png', 'ALG', 'EQUIPO'),

-- Más jugadores
('ALG14', 'Islam Slimani', '1988-06-18', 188, 83, 'Coritiba', TRUE, 'https://example.com/slimani.png', 'ALG', 'Delantero'),

('ALG15', 'Baghdad Bounedjah', '1991-11-30', 184, 78, 'Al Shamal', TRUE, 'https://example.com/bounedjah.png', 'ALG', 'Delantero'),

('ALG16', 'Mohamed Amoura', '2000-05-09', 170, 65, 'Wolfsburg', TRUE, 'https://example.com/amoura.png', 'ALG', 'Delantero'),

('ALG17', 'Said Benrahma', '1995-08-10', 172, 67, 'Lyon', TRUE, 'https://example.com/benrahma.png', 'ALG', 'Extremo'),

('ALG18', 'Anis Hadj Moussa', '2002-02-11', 175, 70, 'Feyenoord', FALSE, 'https://example.com/hadj_moussa.png', 'ALG', 'Extremo'),

('ALG19', 'Adam Ounas', '1996-11-11', 178, 72, 'Lille', FALSE, 'https://example.com/ounas.png', 'ALG', 'Extremo'),

('ALG20', 'Yassine Benzia', '1994-09-08', 180, 74, 'Qarabağ', FALSE, 'https://example.com/benzia.png', 'ALG', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'ALG'
WHERE id like 'ALG%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('AUT1', 'Escudo Selección Austria', NULL, NULL, NULL, 'Selección Austria', TRUE, 'https://example.com/austria_escudo.png', 'AUT', 'ESCUDO'),

-- Jugadores
('AUT2', 'Patrick Pentz', '1997-01-02', 186, 82, 'Brøndby', TRUE, 'https://example.com/pentz.png', 'AUT', 'Arquero'),

('AUT3', 'Heinz Lindner', '1990-07-17', 187, 80, 'FC Sion', FALSE, 'https://example.com/lindner.png', 'AUT', 'Arquero'),

('AUT4', 'David Alaba', '1992-06-24', 180, 78, 'Real Madrid', TRUE, 'https://example.com/alaba.png', 'AUT', 'Defensa'),

('AUT5', 'Philipp Lienhart', '1996-07-11', 189, 81, 'SC Freiburg', TRUE, 'https://example.com/lienhart.png', 'AUT', 'Defensa'),

('AUT6', 'Kevin Danso', '1998-09-19', 190, 84, 'Lens', TRUE, 'https://example.com/danso.png', 'AUT', 'Defensa'),

('AUT7', 'Stefan Posch', '1997-05-14', 188, 82, 'Bologna', TRUE, 'https://example.com/posch.png', 'AUT', 'Defensa'),

('AUT8', 'Konrad Laimer', '1997-05-27', 180, 74, 'Bayern Múnich', TRUE, 'https://example.com/laimer.png', 'AUT', 'Volante'),

('AUT9', 'Xaver Schlager', '1997-09-28', 174, 70, 'RB Leipzig', TRUE, 'https://example.com/schlager.png', 'AUT', 'Volante'),

('AUT10', 'Marcel Sabitzer', '1994-03-17', 178, 74, 'Borussia Dortmund', TRUE, 'https://example.com/sabitzer.png', 'AUT', 'Volante'),

('AUT11', 'Florian Grillitsch', '1995-08-07', 187, 77, 'Hoffenheim', FALSE, 'https://example.com/grillitsch.png', 'AUT', 'Volante'),

('AUT12', 'Marko Arnautović', '1989-04-19', 191, 83, 'Inter de Milán', TRUE, 'https://example.com/arnautovic.png', 'AUT', 'Delantero'),

-- Equipo
('AUT13', 'Selección Austria 2026', NULL, NULL, NULL, 'Selección Austria', TRUE, 'https://example.com/seleccion_austria_2026.png', 'AUT', 'EQUIPO'),

-- Más jugadores
('AUT14', 'Michael Gregoritsch', '1994-04-18', 193, 86, 'SC Freiburg', TRUE, 'https://example.com/gregoritsch.png', 'AUT', 'Delantero'),

('AUT15', 'Christoph Baumgartner', '1999-08-01', 180, 73, 'RB Leipzig', TRUE, 'https://example.com/baumgartner.png', 'AUT', 'Mediapunta'),

('AUT16', 'Nicolas Seiwald', '2001-05-04', 179, 72, 'RB Leipzig', TRUE, 'https://example.com/seiwald.png', 'AUT', 'Volante'),

('AUT17', 'Patrick Wimmer', '2001-05-30', 182, 75, 'Wolfsburg', TRUE, 'https://example.com/wimmer.png', 'AUT', 'Extremo'),

('AUT18', 'Karim Onisiwo', '1992-03-17', 188, 84, 'Mainz', FALSE, 'https://example.com/onisiwo.png', 'AUT', 'Delantero'),

('AUT19', 'Alexander Schlager', '1996-02-01', 184, 79, 'LASK', FALSE, 'https://example.com/alex_schlager.png', 'AUT', 'Arquero'),

('AUT20', 'Romano Schmid', '2000-01-27', 168, 66, 'Werder Bremen', TRUE, 'https://example.com/schmid.png', 'AUT', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'AUT'
WHERE id like 'AUT%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('JOR1', 'Escudo Selección Jordania', NULL, NULL, NULL, 'Selección Jordania', TRUE, 'https://example.com/jordania_escudo.png', 'JOR', 'ESCUDO'),

-- Jugadores
('JOR2', 'Yazeed Abulaila', '1991-06-27', 188, 82, 'Al-Faisaly', TRUE, 'https://example.com/abulaila.png', 'JOR', 'Arquero'),

('JOR3', 'Abdallah Al-Fakhouri', '2000-02-02', 190, 84, 'Al-Wehdat', FALSE, 'https://example.com/fakhouri.png', 'JOR', 'Arquero'),

('JOR4', 'Yazan Al-Arab', '1997-01-31', 189, 83, 'Al-Wehdat', TRUE, 'https://example.com/yazan_arab.png', 'JOR', 'Defensa'),

('JOR5', 'Salem Al-Ajalin', '1990-06-30', 180, 75, 'Al-Faisaly', TRUE, 'https://example.com/ajaliln.png', 'JOR', 'Defensa'),

('JOR6', 'Mohannad Abu Taha', '1996-09-05', 182, 78, 'Al-Hussein', FALSE, 'https://example.com/abutaah.png', 'JOR', 'Defensa'),

('JOR7', 'Anas Bani Yaseen', '1988-08-09', 185, 81, 'Al-Faisaly', FALSE, 'https://example.com/bani_yaseen.png', 'JOR', 'Defensa'),

('JOR8', 'Baha’ Faisal', '1995-05-30', 176, 72, 'Al-Wehdat', TRUE, 'https://example.com/baha_faisal.png', 'JOR', 'Delantero'),

('JOR9', 'Musa Al-Taamari', '1997-06-10', 175, 70, 'Montpellier', TRUE, 'https://example.com/taamari.png', 'JOR', 'Extremo'),

('JOR10', 'Yaseen Al-Bakhit', '1990-10-21', 178, 73, 'Al-Wehdat', TRUE, 'https://example.com/bakhit.png', 'JOR', 'Extremo'),

('JOR11', 'Nizar Al-Rashdan', '1998-04-28', 180, 74, 'Al-Faisaly', FALSE, 'https://example.com/rashdan.png', 'JOR', 'Volante'),

('JOR12', 'Ehsan Haddad', '1994-04-06', 177, 71, 'Al-Wehdat', FALSE, 'https://example.com/haddad.png', 'JOR', 'Defensa'),

-- Equipo
('JOR13', 'Selección Jordania 2026', NULL, NULL, NULL, 'Selección Jordania', TRUE, 'https://example.com/seleccion_jordania_2026.png', 'JOR', 'EQUIPO'),

-- Más jugadores
('JOR14', 'Ahmed Samir', '1991-01-01', 178, 72, 'Al-Wehdat', FALSE, 'https://example.com/samir.png', 'JOR', 'Volante'),

('JOR15', 'Mahmoud Al-Mardi', '1993-12-10', 174, 70, 'Al-Faisaly', TRUE, 'https://example.com/mardi.png', 'JOR', 'Extremo'),

('JOR16', 'Abdullah Nasib', '1993-10-01', 183, 77, 'Al-Wehdat', FALSE, 'https://example.com/nasib.png', 'JOR', 'Defensa'),

('JOR17', 'Saleh Rateb', '1994-06-19', 175, 71, 'Al-Faisaly', FALSE, 'https://example.com/rateb.png', 'JOR', 'Volante'),

('JOR18', 'Omar Hani', '2000-02-03', 172, 68, 'Al-Wehdat', TRUE, 'https://example.com/hani.png', 'JOR', 'Extremo'),

('JOR19', 'Mohammad Abu Zrayq', '1997-11-15', 176, 72, 'Al-Wehdat', TRUE, 'https://example.com/abuzrayq.png', 'JOR', 'Delantero'),

('JOR20', 'Hamza Al-Dardour', '1991-05-12', 178, 74, 'Al-Faisaly', TRUE, 'https://example.com/dardour.png', 'JOR', 'Delantero');


UPDATE laminas_panini_2026
SET iso3 = 'JOR'
WHERE id like 'JOR%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('ENG1', 'Escudo Selección Inglaterra', NULL, NULL, NULL, 'Selección Inglaterra', TRUE, 'https://example.com/inglaterra_escudo.png', 'ENG', 'ESCUDO'),

-- Jugadores
('ENG2', 'Jordan Pickford', '1994-03-07', 185, 77, 'Everton', TRUE, 'https://example.com/pickford.png', 'ENG', 'Arquero'),

('ENG3', 'Aaron Ramsdale', '1998-05-14', 188, 79, 'Arsenal', FALSE, 'https://example.com/ramsdale.png', 'ENG', 'Arquero'),

('ENG4', 'John Stones', '1994-05-28', 188, 76, 'Manchester City', TRUE, 'https://example.com/stones.png', 'ENG', 'Defensa'),

('ENG5', 'Harry Maguire', '1993-03-05', 194, 100, 'Manchester United', TRUE, 'https://example.com/maguire.png', 'ENG', 'Defensa'),

('ENG6', 'Kyle Walker', '1990-05-28', 183, 83, 'Manchester City', TRUE, 'https://example.com/walker.png', 'ENG', 'Defensa'),

('ENG7', 'Luke Shaw', '1995-07-12', 178, 75, 'Manchester United', TRUE, 'https://example.com/shaw.png', 'ENG', 'Defensa'),

('ENG8', 'Declan Rice', '1999-01-14', 185, 80, 'Arsenal', TRUE, 'https://example.com/rice.png', 'ENG', 'Volante'),

('ENG9', 'Jude Bellingham', '2003-06-29', 186, 75, 'Real Madrid', TRUE, 'https://example.com/bellingham.png', 'ENG', 'Volante'),

('ENG10', 'Phil Foden', '2000-05-28', 171, 70, 'Manchester City', TRUE, 'https://example.com/foden.png', 'ENG', 'Volante'),

('ENG11', 'Mason Mount', '1999-01-10', 181, 74, 'Manchester United', FALSE, 'https://example.com/mount.png', 'ENG', 'Volante'),

('ENG12', 'Bukayo Saka', '2001-09-05', 178, 72, 'Arsenal', TRUE, 'https://example.com/saka.png', 'ENG', 'Extremo'),

-- Equipo
('ENG13', 'Selección Inglaterra 2026', NULL, NULL, NULL, 'Selección Inglaterra', TRUE, 'https://example.com/seleccion_inglaterra_2026.png', 'ENG', 'EQUIPO'),

-- Más jugadores
('ENG14', 'Harry Kane', '1993-07-28', 188, 86, 'Bayern Múnich', TRUE, 'https://example.com/kane.png', 'ENG', 'Delantero'),

('ENG15', 'Marcus Rashford', '1997-10-31', 185, 70, 'Manchester United', TRUE, 'https://example.com/rashford.png', 'ENG', 'Delantero'),

('ENG16', 'Jack Grealish', '1995-09-10', 180, 77, 'Manchester City', TRUE, 'https://example.com/grealish.png', 'ENG', 'Extremo'),

('ENG17', 'Raheem Sterling', '1994-12-08', 170, 69, 'Chelsea', TRUE, 'https://example.com/sterling.png', 'ENG', 'Extremo'),

('ENG18', 'James Maddison', '1996-11-23', 175, 73, 'Tottenham', TRUE, 'https://example.com/maddison.png', 'ENG', 'Mediapunta'),

('ENG19', 'Trent Alexander-Arnold', '1998-10-07', 180, 69, 'Liverpool', TRUE, 'https://example.com/trent.png', 'ENG', 'Defensa'),

('ENG20', 'Kalvin Phillips', '1995-12-02', 178, 72, 'West Ham', FALSE, 'https://example.com/phillips.png', 'ENG', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'ENG'
WHERE id like 'ENG%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('CRO1', 'Escudo Selección Croacia', NULL, NULL, NULL, 'Selección Croacia', TRUE, 'https://example.com/croacia_escudo.png', 'CRO', 'ESCUDO'),

-- Jugadores
('CRO2', 'Dominik Livaković', '1995-01-09', 188, 79, 'Fenerbahçe', TRUE, 'https://example.com/livakovic.png', 'CRO', 'Arquero'),

('CRO3', 'Ivica Ivušić', '1995-02-01', 195, 85, 'Pafos FC', FALSE, 'https://example.com/ivusic.png', 'CRO', 'Arquero'),

('CRO4', 'Joško Gvardiol', '2002-01-23', 185, 80, 'Manchester City', TRUE, 'https://example.com/gvardiol.png', 'CRO', 'Defensa'),

('CRO5', 'Dejan Lovren', '1989-07-05', 188, 84, 'PAOK', TRUE, 'https://example.com/lovren.png', 'CRO', 'Defensa'),

('CRO6', 'Josip Šutalo', '2000-02-28', 188, 82, 'Ajax', TRUE, 'https://example.com/sutalo.png', 'CRO', 'Defensa'),

('CRO7', 'Borna Sosa', '1998-01-21', 187, 79, 'Ajax', TRUE, 'https://example.com/sosa.png', 'CRO', 'Defensa'),

('CRO8', 'Luka Modrić', '1985-09-09', 172, 66, 'Real Madrid', TRUE, 'https://example.com/modric.png', 'CRO', 'Volante'),

('CRO9', 'Mateo Kovačić', '1994-05-06', 178, 77, 'Manchester City', TRUE, 'https://example.com/kovacic.png', 'CRO', 'Volante'),

('CRO10', 'Marcelo Brozović', '1992-11-16', 181, 78, 'Al Nassr', TRUE, 'https://example.com/brozovic.png', 'CRO', 'Volante'),

('CRO11', 'Mario Pašalić', '1995-02-09', 188, 78, 'Atalanta', FALSE, 'https://example.com/pasalic.png', 'CRO', 'Volante'),

('CRO12', 'Lovro Majer', '1998-01-17', 178, 74, 'Wolfsburg', TRUE, 'https://example.com/majer.png', 'CRO', 'Mediapunta'),

-- Equipo
('CRO13', 'Selección Croacia 2026', NULL, NULL, NULL, 'Selección Croacia', TRUE, 'https://example.com/seleccion_croacia_2026.png', 'CRO', 'EQUIPO'),

-- Más jugadores
('CRO14', 'Andrej Kramarić', '1991-06-19', 177, 73, 'Hoffenheim', TRUE, 'https://example.com/kramaric.png', 'CRO', 'Delantero'),

('CRO15', 'Ante Budimir', '1991-07-22', 190, 80, 'Osasuna', TRUE, 'https://example.com/budimir.png', 'CRO', 'Delantero'),

('CRO16', 'Bruno Petković', '1994-09-16', 193, 84, 'Dinamo Zagreb', TRUE, 'https://example.com/petkovic.png', 'CRO', 'Delantero'),

('CRO17', 'Ivan Perišić', '1989-02-02', 186, 80, 'Hajduk Split', TRUE, 'https://example.com/perisic.png', 'CRO', 'Extremo'),

('CRO18', 'Nikola Vlašić', '1997-10-04', 178, 72, 'Torino', TRUE, 'https://example.com/vlasic.png', 'CRO', 'Mediapunta'),

('CRO19', 'Josip Juranović', '1995-08-16', 173, 68, 'Union Berlin', FALSE, 'https://example.com/juranovic.png', 'CRO', 'Defensa'),

('CRO20', 'Martin Baturina', '2003-02-16', 172, 65, 'Dinamo Zagreb', TRUE, 'https://example.com/baturina.png', 'CRO', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'CRO'
WHERE id like 'CRO%';

INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('GHA1', 'Escudo Selección Ghana', NULL, NULL, NULL, 'Selección Ghana', TRUE, 'https://example.com/ghana_escudo.png', 'GHA', 'ESCUDO'),

-- Jugadores
('GHA2', 'Lawrence Ati-Zigi', '1996-11-29', 189, 82, 'St. Gallen', TRUE, 'https://example.com/ati_zigi.png', 'GHA', 'Arquero'),

('GHA3', 'Joseph Wollacott', '1996-09-08', 190, 84, 'Hibernian', FALSE, 'https://example.com/wollacott.png', 'GHA', 'Arquero'),

('GHA4', 'Daniel Amartey', '1994-12-21', 186, 82, 'Beşiktaş', TRUE, 'https://example.com/amartey.png', 'GHA', 'Defensa'),

('GHA5', 'Alexander Djiku', '1994-08-09', 182, 78, 'Fenerbahçe', TRUE, 'https://example.com/djiku.png', 'GHA', 'Defensa'),

('GHA6', 'Mohammed Salisu', '1999-04-17', 191, 85, 'Monaco', TRUE, 'https://example.com/salisu.png', 'GHA', 'Defensa'),

('GHA7', 'Alidu Seidu', '2000-06-04', 179, 74, 'Rennes', TRUE, 'https://example.com/seidu.png', 'GHA', 'Defensa'),

('GHA8', 'Thomas Partey', '1993-06-13', 185, 78, 'Arsenal', TRUE, 'https://example.com/partey.png', 'GHA', 'Volante'),

('GHA9', 'Iñaki Williams', '1994-06-15', 186, 79, 'Athletic Club', TRUE, 'https://example.com/williams.png', 'GHA', 'Delantero'),

('GHA10', 'Mohammed Kudus', '2000-08-02', 177, 70, 'West Ham', TRUE, 'https://example.com/kudus.png', 'GHA', 'Volante'),

('GHA11', 'Elisha Owusu', '1997-11-07', 178, 72, 'Auxerre', FALSE, 'https://example.com/owusu.png', 'GHA', 'Volante'),

('GHA12', 'Jordan Ayew', '1991-09-11', 182, 75, 'Crystal Palace', TRUE, 'https://example.com/ayew.png', 'GHA', 'Delantero'),

-- Equipo
('GHA13', 'Selección Ghana 2026', NULL, NULL, NULL, 'Selección Ghana', TRUE, 'https://example.com/seleccion_ghana_2026.png', 'GHA', 'EQUIPO'),

-- Más jugadores
('GHA14', 'Andre Ayew', '1989-12-17', 175, 72, 'Le Havre', TRUE, 'https://example.com/andre_ayew.png', 'GHA', 'Delantero'),

('GHA15', 'Kamaldeen Sulemana', '2002-02-15', 175, 68, 'Southampton', TRUE, 'https://example.com/sulemana.png', 'GHA', 'Extremo'),

('GHA16', 'Antoine Semenyo', '2000-01-07', 185, 79, 'Bournemouth', TRUE, 'https://example.com/semenyo.png', 'GHA', 'Delantero'),

('GHA17', 'Gideon Mensah', '1998-07-09', 179, 71, 'Auxerre', FALSE, 'https://example.com/mensah.png', 'GHA', 'Defensa'),

('GHA18', 'Joseph Paintsil', '1998-02-01', 172, 70, 'LA Galaxy', TRUE, 'https://example.com/paintsil.png', 'GHA', 'Extremo'),

('GHA19', 'Salis Abdul Samed', '2000-03-26', 179, 73, 'Lens', TRUE, 'https://example.com/samed.png', 'GHA', 'Volante'),

('GHA20', 'Daniel-Kofi Kyereh', '1996-03-08', 183, 75, 'Freiburg', FALSE, 'https://example.com/kyereh.png', 'GHA', 'Delantero');

UPDATE laminas_panini_2026
SET iso3 = 'GHA'
WHERE id like 'GHA%';


INSERT INTO laminas_panini_2026
(id, nombre_sticker, fecha_nacimiento, estatura_cm, peso_kg, equipo_actual, es_especial, foto_url, iso3, posicion)
VALUES
-- Escudo
('PAN1', 'Escudo Selección Panamá', NULL, NULL, NULL, 'Selección Panamá', TRUE, 'https://example.com/panama_escudo.png', 'PAN', 'ESCUDO'),

-- Jugadores
('PAN2', 'Luis Mejía', '1990-03-16', 190, 86, 'Nacional', TRUE, 'https://example.com/mejia.png', 'PAN', 'Arquero'),

('PAN3', 'Orlando Mosquera', '1994-12-25', 188, 83, 'Maccabi Tel Aviv', FALSE, 'https://example.com/mosquera.png', 'PAN', 'Arquero'),

('PAN4', 'Fidel Escobar', '1995-01-09', 185, 80, 'Saprissa', TRUE, 'https://example.com/escobar.png', 'PAN', 'Defensa'),

('PAN5', 'Harold Cummings', '1992-03-01', 186, 82, 'Alianza FC', FALSE, 'https://example.com/cummings.png', 'PAN', 'Defensa'),

('PAN6', 'Michael Murillo', '1996-02-11', 180, 76, 'Olympique de Marseille', TRUE, 'https://example.com/murillo.png', 'PAN', 'Defensa'),

('PAN7', 'Andrés Andrade', '1998-02-16', 178, 73, 'Arminia Bielefeld', TRUE, 'https://example.com/andrade.png', 'PAN', 'Defensa'),

('PAN8', 'Aníbal Godoy', '1990-02-10', 182, 78, 'Nashville SC', TRUE, 'https://example.com/godoy.png', 'PAN', 'Volante'),

('PAN9', 'Édgar Bárcenas', '1993-10-23', 177, 72, 'Mazatlán', TRUE, 'https://example.com/barcenas.png', 'PAN', 'Volante'),

('PAN10', 'Adalberto Carrasquilla', '1998-11-28', 174, 70, 'Houston Dynamo', TRUE, 'https://example.com/carrasquilla.png', 'PAN', 'Volante'),

('PAN11', 'Alberto Quintero', '1987-12-18', 172, 68, 'Universitario', FALSE, 'https://example.com/quintero.png', 'PAN', 'Extremo'),

('PAN12', 'Cecilio Waterman', '1991-04-13', 183, 78, 'Cobresal', TRUE, 'https://example.com/waterman.png', 'PAN', 'Delantero'),

-- Equipo
('PAN13', 'Selección Panamá 2026', NULL, NULL, NULL, 'Selección Panamá', TRUE, 'https://example.com/seleccion_panama_2026.png', 'PAN', 'EQUIPO'),

-- Más jugadores
('PAN14', 'José Fajardo', '1993-08-18', 181, 77, 'DC United', TRUE, 'https://example.com/fajardo.png', 'PAN', 'Delantero'),

('PAN15', 'Ismael Díaz', '1997-05-12', 178, 74, 'Universidad Católica', TRUE, 'https://example.com/diaz.png', 'PAN', 'Extremo'),

('PAN16', 'Gabriel Torres', '1988-10-31', 183, 79, 'Independiente del Valle', TRUE, 'https://example.com/torres.png', 'PAN', 'Delantero'),

('PAN17', 'Eric Davis', '1991-03-31', 176, 72, 'DC United', FALSE, 'https://example.com/davis.png', 'PAN', 'Defensa'),

('PAN18', 'Jovani Welch', '1999-04-11', 180, 75, 'Tauro FC', FALSE, 'https://example.com/welch.png', 'PAN', 'Volante'),

('PAN19', 'Cristian Martínez', '1997-02-18', 175, 71, 'Deportivo La Guaira', FALSE, 'https://example.com/martinez.png', 'PAN', 'Volante'),

('PAN20', 'Carlos Harvey', '2000-02-02', 182, 76, 'Minnesota United', TRUE, 'https://example.com/harvey.png', 'PAN', 'Volante');

UPDATE laminas_panini_2026
SET iso3 = 'PAN'
WHERE id like 'PAN%';

select * from laminas_panini_2026
where iso3 is null;


select count(*) from laminas_panini_2026;





