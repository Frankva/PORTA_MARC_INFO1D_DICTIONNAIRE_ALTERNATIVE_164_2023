-- 2023-03-15 Marc Louis PORTA

-- création base de donnée
DROP DATABASE IF EXISTS Porta_Marc_info1d_164;
CREATE DATABASE IF NOT EXISTS Porta_Marc_info1d_164;
USE Porta_Marc_info1d_164;



-- création des tables
CREATE TABLE t_personne (
    id_personne int NOT NULL AUTO_INCREMENT,
    nom_pers varchar(50) DEFAULT NULL,
    prenom_pers varchar(50) DEFAULT NULL,
    date_naissance_pers date DEFAULT NULL,
    taille_pers int DEFAULT NULL,
    masse_pers int DEFAULT NULL,
    sexe_pers varchar(50) DEFAULT NULL,
    lieu_naissance_pers varchar(50) DEFAULT NULL,
    groupe_sanguin_pers varchar(50) DEFAULT NULL,
    chromosomes_pers varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_personne)
);

CREATE TABLE t_mail (
    id_mail int NOT NULL AUTO_INCREMENT,
    nom_mail varchar(255) DEFAULT NULL,
    PRIMARY KEY(id_mail)
);

CREATE TABLE t_pers_avoir_mail (
    id_pers_avoir_mail int NOT NULL AUTO_INCREMENT,
    fk_personne int DEFAULT NULL,
    fk_mail int DEFAULT NULL,
    date_mail timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY(id_pers_avoir_mail),
    FOREIGN KEY (fk_personne) REFERENCES t_personne(id_personne),
    FOREIGN KEY (fk_mail) REFERENCES t_mail(id_mail)
);

CREATE TABLE t_profession (
    id_profession int NOT NULL AUTO_INCREMENT,
    nom_prof varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_profession)
);

CREATE TABLE t_pers_avoir_prof (
    id_pers_avoir_prof int NOT NULL AUTO_INCREMENT,
    fk_personne int DEFAULT NULL,
    fk_profession int DEFAULT NULL,
    date_prof timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY(id_pers_avoir_prof),
    FOREIGN KEY (fk_personne) REFERENCES t_personne(id_personne),
    FOREIGN KEY (fk_profession) REFERENCES t_profession(id_profession)
);

CREATE TABLE t_telephone (
    id_telephone int NOT NULL AUTO_INCREMENT,
    num_tele varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_telephone)
);

CREATE TABLE t_pers_avoir_tele (
    id_pers_avoir_tele int NOT NULL AUTO_INCREMENT,
    fk_personne int DEFAULT NULL,
    fk_telephone int DEFAULT NULL,
    date_tele timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY(id_pers_avoir_tele),
    FOREIGN KEY (fk_personne) REFERENCES t_personne(id_personne),
    FOREIGN KEY (fk_telephone) REFERENCES t_telephone(id_telephone)
);

CREATE TABLE t_pays (
    id_pays int NOT NULL AUTO_INCREMENT,
    nom_pays varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_pays)
);

CREATE TABLE t_pers_ressortir_pays (
    id_pers_ressortir_pays int NOT NULL AUTO_INCREMENT,
    fk_personne int DEFAULT NULL,
    fk_pays int DEFAULT NULL,
    date_pays timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY(id_pers_ressortir_pays),
    FOREIGN KEY (fk_personne) REFERENCES t_personne(id_personne),
    FOREIGN KEY (fk_pays) REFERENCES t_pays(id_pays)
);

CREATE TABLE t_adresse (
    id_adresse int NOT NULL AUTO_INCREMENT,
    ville_adre varchar(50) DEFAULT NULL,
    NPA_adre int DEFAULT NULL,
    rue_adre varchar(50) DEFAULT NULL,
    numero_adre varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_adresse)
);

CREATE TABLE t_pers_habiter_adre (
    id_pers_habiter_adre int NOT NULL AUTO_INCREMENT,
    fk_personne int DEFAULT NULL,
    fk_adresse int DEFAULT NULL,
    date_adre timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY(id_pers_habiter_adre),
    FOREIGN KEY (fk_personne) REFERENCES t_personne(id_personne),
    FOREIGN KEY (fk_adresse) REFERENCES t_adresse(id_adresse)
);

CREATE TABLE t_classe_gramaticale (
    id_classe_gramaticale int NOT NULL AUTO_INCREMENT,
    nom_clas varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_classe_gramaticale)
);

CREATE TABLE t_article (
    id_article int not NULL AUTO_INCREMENT,
    fk_classe_gramaticale int DEFAULT NULL,
    PRIMARY KEY(id_article),
    FOREIGN KEY (fk_classe_gramaticale) REFERENCES t_classe_gramaticale(
        id_classe_gramaticale)
);

CREATE TABLE t_genre (
    id_genre int NOT NULL AUTO_INCREMENT,
    nom_genre varchar(50) DEFAULT NULL,
    PRIMARY KEY(id_genre)
);

CREATE TABLE t_arti_avoir_genr (
    id_arti_avoir_genr int NOT NULL AUTO_INCREMENT,
    fk_article int DEFAULT NULL,
    fk_genre int DEFAULT NULL,
    PRIMARY KEY(id_arti_avoir_genr),
    FOREIGN KEY (fk_article) REFERENCES t_article(id_article),
    FOREIGN KEY (fk_genre) REFERENCES t_genre(id_genre)
);

CREATE TABLE t_image (
    id_image int NOT NULL AUTO_INCREMENT,
    description_imag varchar(255) DEFAULT NULL,
    url_imag varchar(255) DEFAULT NULL,
    PRIMARY KEY(id_image)
);

CREATE TABLE t_pers_autoriser_imag (
    id_pers_autoriser_imag int NOT NULL AUTO_INCREMENT,
    fk_personne int DEFAULT NULL,
    fk_image int DEFAULT NULL,
    PRIMARY KEY(id_pers_autoriser_imag),
    FOREIGN KEY (fk_personne) REFERENCES t_personne(id_personne),
    FOREIGN KEY (fk_image) REFERENCES t_image(id_image)
);

CREATE TABLE t_pers_avoir_imag (
    id_pers_avoir_imag int NOT NULL AUTO_INCREMENT,
    fk_personne int DEFAULT NULL,
    fk_image int DEFAULT NULL,
    PRIMARY KEY(id_pers_avoir_imag),
    FOREIGN KEY (fk_personne) REFERENCES t_personne(id_personne),
    FOREIGN KEY (fk_image) REFERENCES t_image(id_image)
);

CREATE TABLE t_arti_avoir_imag (
    id_arti_avoir_imag int NOT NULL AUTO_INCREMENT,
    fk_article int DEFAULT NULL,
    fk_image int DEFAULT NULL,
    PRIMARY KEY(id_arti_avoir_imag),
    FOREIGN KEY (fk_article) REFERENCES t_article(id_article),
    FOREIGN KEY (fk_image) REFERENCES t_image(id_image)
);




-- rempli

INSERT INTO t_personne (nom_pers, prenom_pers, date_naissance_pers, 
    taille_pers, masse_pers, sexe_pers, lieu_naissance_pers,
    groupe_sanguin_pers, chromosomes_pers)
VALUES
('Cadman', 'Doyle', '2012-08-01', 180, 60, 'f', 'ici', 'c++', 'xx'),
('Valenzuela', 'Cassandra', '2000-08-03', 170, 80, 'f', 'non', 'a-', 'xx'),
('Brooks', 'Ferris', '1989-11-01', 163, 90, 'm', 'là-bas', 'o', 'xx'),
('Monroe', 'Jarrod', '1989-11-11', 183, 83, 'm', NULL, 'a+', 'xy'),
('Alford', 'Sasha', '1980-01-11', 166, 120, 'f', 'là', 'o', 'xx'),
(' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


INSERT INTO t_mail (nom_mail) VALUES
('a@a.a'),
('b@b.b'),
('c@c.c'),
('d@d.d'),
('sed.nec.metus@google.edu'),
('vitae.nibh@protonmail.ca'),
('nunc.ac@aol.com'),
('semper@yahoo.couk'),
('sed.diam@google.net'),
('sodales.at@protonmail.org');

INSERT INTO t_pers_avoir_mail (fk_personne, fk_mail, date_mail) VALUES
(5, 2, '2022-11-24 07:55:35'),
(5, 1, '2022-11-24 07:57:41'),
(5, 9, '2022-12-12 09:33:04'),
(4, 8, '2022-12-12 09:33:04'),
(3, 7, '2022-12-12 09:33:04'),
(2, 6, '2022-12-12 09:33:04'),
(1, 5, '2022-12-12 09:33:04');

INSERT INTO t_profession (nom_prof) VALUES
('boulanger'),
('professeur'),
('médecin'),
('mineur'),
('directeur'),
('fermier'),
('auteur');

INSERT INTO t_pers_avoir_prof (fk_personne, fk_profession, date_prof) VALUES
(1, 1, '2022-12-07 08:45:28'),
(5, 7, '2022-12-12 09:34:35'),
(4, 6, '2022-12-12 09:34:35'),
(3, 5, '2022-12-12 09:34:35'),
(2, 4, '2022-12-12 09:34:35'),
(1, 3, '2022-12-12 09:34:35');

INSERT INTO t_telephone (num_tele) VALUES
('0000000'),
('1111111'),
('(492) 534-8744'),
('(922) 450-6630'),
('1-660-648-1952'),
('(724) 860-0319'),
('(277) 863-6707');

INSERT INTO t_pers_avoir_tele (fk_personne, fk_telephone, date_tele) VALUES
(1, 1, '2022-11-30 21:24:17'),
(5, 7, '2022-12-12 09:35:54'),
(4, 6, '2022-12-12 09:35:54'),
(3, 5, '2022-12-12 09:35:54'),
(2, 4, '2022-12-12 09:35:54'),
(1, 3, '2022-12-12 09:35:54');

INSERT INTO t_pays (nom_pays) VALUES
('Suisse'),
('France'),
('Norvège'),
('Brésil'),
('Belgique'),
('Canada'),
('Royaume-Uni');

INSERT INTO t_pers_ressortir_pays (fk_personne, fk_pays, date_pays) VALUES
(1, 1, '2022-11-30 21:24:45'),
(5, 7, '2022-12-12 09:38:18'),
(4, 6, '2022-12-12 09:38:18'),
(3, 5, '2022-12-12 09:38:18'),
(2, 4, '2022-12-12 09:38:18'),
(1, 3, '2022-12-12 09:38:18');


INSERT INTO t_adresse (ville_adre, NPA_adre, rue_adre, numero_adre) VALUES
('Lausanne', 1000, 'Chemin de la vi', '22'),
('Ohio', 350418, 'Lectus Rd', '8122'),
('Araucanía', 602252, 'Eu Ave', '247-9173 '),
('Ancash', 852345, 'Eget Street', '722-1624'),
('Connacht', 35772, 'P.O. Box 785, Est. St.', '7909'),
('Nordrhein-Westphalen', 770320, 'Congue, Rd.', '653-9109 ');

INSERT INTO t_pers_habiter_adre (fk_personne, fk_adresse, date_adre) VALUES
(1, 1, '2022-11-30 21:24:29'),
(5, 6, '2022-12-12 09:37:03'),
(4, 5, '2022-12-12 09:37:03'),
(3, 4, '2022-12-12 09:37:03'),
(2, 3, '2022-12-12 09:37:03'),
(1, 2, '2022-12-12 09:37:03');
