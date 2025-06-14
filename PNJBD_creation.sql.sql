CREATE SCHEMA `mini_projet` ;
USE `mini_projet`;

CREATE TABLE Localisation(
   id_localisation INT, -- Identifiant unique pour chaque localisation.
   region VARCHAR(50) NOT NULL, -- Nom de la region où se situe la localisation.
   contree VARCHAR(50) NOT NULL, -- Nom de la contree specifique.
   lieu VARCHAR(50) UNIQUE NOT NULL, -- Nom du lieu, doit être unique.
   PRIMARY KEY(id_localisation) -- Définition de la clé primaire sur id_localisation.
);

CREATE TABLE Extension(
   id_extension INT, -- Identifiant unique pour chaque extension.
   nom_extension VARCHAR(50) UNIQUE NOT NULL, -- Nom de l'extension, doit être unique.
   PRIMARY KEY(id_extension) -- Définition de la clé primaire sur id_extension.
);

CREATE TABLE Quete(
   id_quete INT, -- Identifiant unique pour chaque quete.
   nom_quete VARCHAR(50) UNIQUE NOT NULL, -- Nom de la quete, doit être unique.
   type_quete VARCHAR(50) NOT NULL, -- Type de quete (ex : principale, secondaire).
   difficulte INT NOT NULL, -- Niveau de difficulte de la quete.
   id_extension INT, -- Reference vers l'extension associee à la quete.
   PRIMARY KEY(id_quete), -- Définition de la clé primaire sur id_quete.
   FOREIGN KEY(id_extension) REFERENCES Extension(id_extension) -- Cle etrangere vers la table Extension.
);

CREATE TABLE PNJ(
   id_PNJ INT, -- Identifiant unique pour chaque PNJ.
   nom_PNJ VARCHAR(50) UNIQUE NOT NULL, -- Nom du PNJ, doit être unique.
   race VARCHAR(50) NOT NULL, -- Race du PNJ (ex : humain, elfe, orc).
   classe VARCHAR(50), -- Classe du PNJ (ex : guerrier, mage).
   niveau INT NOT NULL, -- Niveau du PNJ.
   metier VARCHAR(50), -- Metier du PNJ, facultatif.
   vitalite INT, -- Points de vie du PNJ.
   `force` INT, -- Valeur de la force du PNJ.
   sagesse INT, -- Valeur de la sagesse du PNJ.
   agilite INT, -- Valeur de l'agilite du PNJ.
   id_localisation INT NOT NULL, -- Reference vers la localisation du PNJ.
   PRIMARY KEY(id_PNJ), -- Définition de la clé primaire sur id_PNJ.
   FOREIGN KEY(id_localisation) REFERENCES Localisation(id_localisation) ON DELETE CASCADE
   -- Cle etrangere vers Localisation, si la localisation est supprimee, les PNJ associés à cette localisation sont supprimés.
);

CREATE TABLE Intervenir( -- Table associative entre PNJ et Quete.
   id_PNJ INT, -- Identifiant du PNJ intervenant dans la quete.
   id_quete INT, -- Identifiant de la quete concernee.
   `role` VARCHAR(50) NOT NULL, -- Role du PNJ dans la quete (ex : donneur de quete, ennemi).
   PRIMARY KEY(id_PNJ, id_quete), -- Cle primaire composite pour eviter les doublons.
   FOREIGN KEY(id_PNJ) REFERENCES PNJ(id_PNJ), -- Cle etrangere vers PNJ.
   FOREIGN KEY(id_quete) REFERENCES Quete(id_quete) -- Cle etrangere vers Quete.
);


