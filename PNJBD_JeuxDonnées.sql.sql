
-- Insertion des données dans la table Localisation

insert into Localisation (id_localisation, region, contree, lieu) values

-- Région 1: Valoria
(1, 'Valoria', 'Forêt d\'Émeraude', 'Clairière Enchantée'),
(2, 'Valoria', 'Forêt d\'Émeraude', 'Arbre Ancien'),
(3, 'Valoria', 'Montagnes Brumeuses', 'Pic du Dragon'),
(4, 'Valoria', 'Montagnes Brumeuses', 'Grotte Mystique'),
(5, 'Valoria', 'Montagnes Brumeuses', 'Source Sacrée'),
(6, 'Valoria', 'Plaines Dorées', 'Ferme du Soleil'),
(7, 'Valoria', 'Plaines Dorées', 'Temple Oublié'),

-- Région 2: Eldoria
(8, 'Eldoria', 'Marais Sombres', 'Îlot Perdu'),
(9, 'Eldoria', 'Marais Sombres', 'Caverne Engloutie'),
(10, 'Eldoria', 'Vallée des Vents', 'Sanctuaire des Brises'),
(11, 'Eldoria', 'Vallée des Vents', 'Pont des Esprits'),
(12, 'Eldoria', 'Vallée des Vents', 'Tour des Tempêtes'),
(13, 'Eldoria', 'Terres Arides', 'Ruines Anciennes'),
(14, 'Eldoria', 'Terres Arides', 'Campement Nomade'),

-- Région 3: Nyméria
(15, 'Nyméria', 'Jungle Luxuriante', 'Cascade Cachée'),
(16, 'Nyméria', 'Jungle Luxuriante', 'Temple Englouti'),
(17, 'Nyméria', 'Toundra Glacée', 'Grotte de Glace'),
(18, 'Nyméria', 'Toundra Glacée', 'Village Gelé'),
(19, 'Nyméria', 'Toundra Glacée', 'Lac Cristallin'),
(20, 'Nyméria', 'Côte Sauvage', 'Phare Abandonné'),
(21, 'Nyméria', 'Côte Sauvage', 'Port Oublié');

-- Insertion des extensions disponibles dans le jeu

insert into Extension (id_extension, nom_extension) values
(1, "L'Appel du Néant"),
(2, "La Guerre des Titans"),
(3, "Les Cités Englouties"),
(4, "Le Royaume Oublié");

-- Insertion des quêtes avec leur difficulté et leur extension associée

insert into Quete (id_quete, nom_quete, type_quete, difficulte, id_extension) values
(1, 'L\'appel du destin', 'Principale', 2, 1),
(2, 'Les vestiges du temps', 'Principale', 4, 2),
(3, 'Le gardien oublié', 'Principale', 2, 3),
(4, 'Le fléau ancestral', 'Principale', 4, 4),
(5, 'Le trésor perdu', 'Principale', 5, NULL),
(6, 'L\'ascension du champion', 'Principale', 4, NULL),
(7, 'Les secrets de la montagne', 'Annexe', 2, NULL),
(8, 'Le rite des anciens', 'Annexe', 2, NULL),
(9, 'L\'attaque des bandits', 'Annexe', 3, NULL),
(10, 'La tour maudite', 'Principale', 4, 3),
(11, 'Les murmures de la forêt', 'Principale', 5, 2),
(12, 'Le duel des légendes', 'Principale', 1, NULL),
(13, 'Les profondeurs oubliées', 'Annexe', 2, 1),
(14, 'La révolte des esclaves', 'Principale', 5, NULL),
(15, 'Le complot royal', 'Annexe', 4, NULL),
(16, 'Les gardiens du temple', 'Annexe', 1, NULL),
(17, 'La chasse au dragon', 'Principale', 2, 2),
(18, 'Les ruines hantées', 'Principale', 4, NULL),
(19, 'L\'oracle des abysses', 'Principale', 4, NULL),
(20, 'Les sentinelles disparues', 'Principale', 1, 3),
(21, 'Le siège de la citadelle', 'Annexe', 5, 1),
(22, 'L\'étoile du destin', 'Annexe', 1, 4),
(23, 'Les reliques interdites', 'Annexe', 5, NULL),
(24, 'La guerre des clans', 'Annexe', 2, 4),
(25, 'Le serment brisé', 'Annexe', 5, NULL),
(26, 'La vengeance du sorcier', 'Principale', 5, NULL),
(27, 'Les flammes du chaos', 'Principale', 3, NULL),
(28, 'L\'ultime sacrifice', 'Principale', 4, NULL),
(29, 'Le pacte du sang', 'Principale', 3, NULL),
(30, 'Les terres interdites', 'Principale', 4, NULL);


-- Insertion des PNJ avec leurs caractéristiques et leur emplacement

insert into PNJ (id_PNJ, nom_PNJ, race, classe, niveau, metier, vitalite, `force`, sagesse, agilite, id_localisation) values
(1, 'Elyndor', 'Humaine', 'Voleur', 11, 'Chasseur', 119, 83, 66, 96, 1),
(2, 'Lirelia', 'Elfe', 'Mage', 25, 'Alchimiste', 152, 51, 124, 77, 10),
(3, 'Thorgrim', 'Nain', 'Protecteur', 43, 'Forgeron', 138, 122, 84, 65, 4),
(4, 'Griznak', 'Gobelin', 'Assassin', 16, 'Mineur', 108, 71, 53, 114, 9),
(5, 'Gorak', 'Orc', 'Épéiste', 32, 'Bucheron', 181, 152, 69, 89, 13),
(6, 'Aelindra', 'Esprit', 'Guérisseur', 89, 'Divinité', 300, 101, 195, 107, 7),
(7, 'Mira', 'Humaine', 'Soutien', 2, 'Paysan', 23, 41, 27, 52, 6),
(8, 'Faelar', 'Elfe', 'Assassin', 27, 'Chasseur de prime', 131, 94, 83, 106, 15),
(9, 'Seraphis', 'Ange', 'Protecteur', 99, 'Divinité', 300, 151, 200, 120, 12),
(10, 'Malachar', 'Démon', 'Assassin', 85, 'Fossoyeur', 200, 129, 176, 131, 18),
(11, 'Elara', 'Humaine', 'Guérisseur', 12, 'Tailleur', 111, 64, 95, 73, 2),
(12, 'Durgrim', 'Nain', 'Épéiste', 36, 'Mineur', 126, 104, 70, 83, 3),
(13, 'Sylvaris', 'Elfe', 'Mage', 28, 'Alchimiste', 139, 59, 124, 91, 16),
(14, 'Snikk', 'Gobelin', 'Voleur', 18, 'Bucheron', 58, 75, 55, 102, 5),
(15, 'Groknak', 'Orc', 'Protecteur', 44, 'Forgeron', 126, 135, 68, 68, 14),
(16, 'Luminis', 'Esprit', 'Soutien', 88, 'Divinité', 300, 108, 179, 117, 19),
(17, 'Kaela', 'Humaine', 'Guérisseur', 8, 'Pêcheur', 90, 50, 65, 75, 20),
(18, 'Celestia', 'Ange', 'Mage', 88, 'Divinité', 300, 120, 176, 145, 11),
(19, 'Zarathos', 'Démon', 'Assassin', 82, 'Fossoyeur', 200, 156, 171, 134, 17),
(20, 'Thalindra', 'Elfe', 'Voleur', 22, 'Chasseur de prime', 135, 85, 75, 95, 21),
(21, 'Rynna', 'Humaine', 'Voleur', 48, 'Chasseur', 126, 88, 66, 94, 1),
(22, 'Aelara', 'Elfe', 'Mage', 33, 'Alchimiste', 162, 54, 139, 79, 10),
(23, 'Borin', 'Nain', 'Protecteur', 50, 'Forgeron', 120, 153, 91, 78, 4),
(24, 'Snaggle', 'Gobelin', 'Assassin', 29, 'Mineur', 105, 79, 66, 127, 9),
(25, 'Tharok', 'Orc', 'Épéiste', 47, 'Bucheron', 200, 132, 72, 91, 13),
(26, 'Lunara', 'Esprit', 'Guérisseur', 85, 'Divinité', 300, 109, 199, 169, 7),
(27, 'Mara', 'Humaine', 'Soutien', 7, 'Paysan', 91, 44, 70, 55, 6),
(28, 'Faelen', 'Elfe', 'Soutien', 28, 'Chasseur de prime', 143, 94, 82, 108, 15),
(29, 'Aetheris', 'Ange', 'Protecteur', 96, 'Divinité', 300, 161, 200, 148, 12),
(30, 'Maltheris', 'Démon', 'Assassin', 90, 'Fossoyeur', 200, 132, 173, 125, 18),
(31, 'Lyna', 'Humaine', 'Guérisseur', 18, 'Tailleur', 121, 75, 103, 88, 2),
(32, 'Thrain', 'Nain', 'Épéiste', 49, 'Mineur', 105, 142, 87, 99, 3),
(33, 'Eryndor', 'Elfe', 'Mage', 32, 'Alchimiste', 124, 71, 58, 113, 16),
(34, 'Grizlak', 'Gobelin', 'Voleur', 22, 'Bucheron', 102, 81, 63, 117, 5),
(35, 'Gorzak', 'Orc', 'Protecteur', 52, 'Forgeron', 134, 176, 85, 78, 14),
(36, 'Aurion', 'Esprit', 'Soutien', 88, 'Divinité', 284, 123, 196, 126, 19),
(37, 'Kaelin', 'Humaine', 'Mage', 12, 'Pêcheur', 100, 55, 25, 53, 20),
(38, 'Seraphine', 'Ange', 'Mage', 92, 'Divinité', 275, 137, 200, 142, 11),
(39, 'Zarathar', 'Démon', 'Assassin', 87, 'Fossoyeur', 195, 158, 186, 149, 17),
(40, 'Thalor', 'Elfe', 'Protecteur', 28, 'Chasseur de prime', 57, 92, 84, 102, 21);

insert into Intervenir (id_PNJ, id_quete, role) values
(1, 1, 'Donneur de quête'),
(1, 7, 'Ennemi'),
(2, 2, 'Allié'),
(3, 3, 'Ennemi'),
(3, 17, 'Boss'),
(4, 4, 'Ennemi'),
(5, 5, 'Ennemi'),
(6, 6, 'Allié'),
(6, 19, 'Allié'),
(7, 7, 'Ennemi'),
(8, 8, 'Marchand'),
(9, 9, 'Ennemi'),
(9, 22, 'Boss'),
(10, 10, 'Donneur de quête'),
(11, 11, 'Marchand'),
(12, 12, 'Ennemi'),
(13, 13, 'Marchand'),
(14, 14, 'Boss'),
(15, 15, 'Marchand'),
(16, 16, 'Ennemi'),
(17, 17, 'Marchand'),
(18, 18, 'Donneur de quête'),
(18, 1, 'Boss'),
(19, 19, 'Boss'),
(20, 20, 'Allié'),
(21, 21, 'Donneur de quête'),
(22, 22, 'Boss'),
(23, 23, 'Donneur de quête'),
(24, 24, 'Marchand'),
(25, 25, 'Allié'),
(26, 26, 'Ennemi'),
(27, 27, 'Ennemi'),
(28, 28, 'Allié'),
(29, 29, 'Donneur de quête'),
(30, 30, 'Ennemi'),
(31, 1, 'Marchand'),
(32, 2, 'Allié'),
(33, 3, 'Marchand'),
(34, 4, 'Boss'),
(35, 5, 'Boss'),
(36, 6, 'Marchand'),
(37, 7, 'Boss'),
(38, 8, 'Marchand'),
(39, 9, 'Allié'),
(40, 10, 'Donneur de quête');



