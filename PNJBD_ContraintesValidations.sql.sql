-- ajout de contraintes sur la table PNJ pour garantir l'intégrité des données
alter table PNJ

-- vérification que la valeur de force est entre 0 et 200
add constraint chk_force check (`force` between 0 and 200),

-- vérification que la valeur de sagesse est entre 0 et 200
add constraint chk_sagesse check (sagesse between 0 and 200),

-- vérification que la vitalité est entre 1 et 300
add constraint chk_vitalite check (vitalite between 1 and 300),

-- vérification que l'agilité est entre 0 et 200
add constraint chk_agilite check (agilite between 0 and 200),

-- vérification que le niveau du PNJ est entre 1 et 100
add constraint chk_niveau check (niveau between 1 and 100),

-- vérification que la classe du PNJ est parmi les classes autorisées
add constraint chk_classe check (classe in ('Voleur', 'Mage', 'Assassin', 'Guérisseur', 'Protecteur', 'Épéiste', 'Soutien')),

-- vérification qu'un PNJ de métier 'Divinité' a au moins le niveau 80
add constraint chk_divinite_niveau check (not (metier = 'Divinité' and niveau < 80)),

-- vérification qu'un PNJ a une vitalité maximale de 200 sauf s'il est une 'Divinité'
add constraint chk_vitalite_divinite check ((vitalite <= 200) or (metier = 'Divinité')),

-- vérification qu'un PNJ de métier 'Forgeron' a une force minimale de 50
add constraint chk_forgeron_force check (not (metier = 'Forgeron' and `force` < 50)),

-- vérification qu'un PNJ de métier 'Alchimiste' a une sagesse minimale de 50
add constraint chk_alchimiste_sagesse check (not (metier = 'Alchimiste' and sagesse < 50)),

-- vérification des restrictions de métier en fonction de la race
add constraint chk_metier_race check (
    -- Métiers réservés aux Humains
    (race = 'Humaine' and metier in ('Bucheron', 'Paysan', 'Mineur', 'Forgeron', 'Chasseur', 'Chasseur de prime', 'Pêcheur', 'Tailleur')) 
    or 
    -- Métiers réservés aux Nains, Gobelins, Orcs
    (race in ('Nain', 'Gobelin', 'Orc') and metier in ('Bucheron', 'Mineur', 'Forgeron')) 
    or 
    -- Métiers réservés aux Elfes
    (race = 'Elfe' and metier in ('Alchimiste', 'Chasseur', 'Chasseur de prime')) 
    or 
    -- Métiers réservés aux Esprits, Anges, Démons
    (race in ('Esprit', 'Ange', 'Démon') and metier in ('Fossoyeur', 'Divinité'))
),

-- contrainte d'unicité pour éviter les doublons dans la localisation des PNJ
add constraint uq_pnj_localisation unique (id_PNJ, id_localisation);


-- ajout de contraintes sur la table quete
alter table Quete

-- vérification que le type de quête est soit 'Principale' soit 'Annexe'
add constraint chk_type_quete check (type_quete in ('Principale', 'Annexe')),

-- vérification que la difficulté est comprise entre 1 et 5
add constraint chk_difficulte check (difficulte between 1 and 5);


-- ajout de contraintes sur la table intervenir
alter table Intervenir

-- vérification que le rôle d'un PNJ dans une quête est valide
add constraint chk_role check (`role` in ('Donneur de quête', 'Ennemi', 'Boss', 'Allié', 'Marchand'));





