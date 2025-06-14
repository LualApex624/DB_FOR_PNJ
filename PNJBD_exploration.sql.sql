-- Lister les noms des PNJ triés par ordre alphabétique
select nom_PNJ 
from PNJ 
order by nom_PNJ ASC;

-- Lister les PNJ d'une classe donnée (ex: "Mage") 
select nom_PNJ, race, niveau 
from PNJ 
where classe = 'Mage';

-- Afficher les PNJ ayant une vitalité supérieure à 200 
select nom_PNJ, race, vitalite 
from PNJ 
where vitalite > 200;

-- Sélectionne les quêtes ayant une difficulté inférieure à 3, triées par difficulté croissante
select nom_quete, difficulte
from Quete
where difficulte < 3
order by difficulte asc;

-- Nombre de fois qu'un PNJ particulier intervient dans des quêtes (ex: "Elyndor") 
select count(*) as nombre_interventions 
from Intervenir 
where id_PNJ = (select id_PNJ from PNJ where nom_PNJ = 'Elyndor');





-- join
-- Lister les PNJ qui interviennent dans une quête spécifique (ex: "L'appel du destin") 
select p.nom_PNJ, p.race, i.role 
from PNJ p
join Intervenir i on p.id_PNJ = i.id_PNJ
join  Quete q on i.id_quete = q.id_quete
where q.nom_quete = 'L\'appel du destin';


-- Sélectionne les PNJ ayant le métier "Alchimiste" et un niveau supérieur à 40
select localisation.lieu, pnj.nom_pnj, pnj.niveau  
from pnj  
join localisation on pnj.id_localisation = localisation.id_localisation  
where pnj.metier = 'Alchimiste' and pnj.niveau > 40;

-- Lister les PNJ situés dans la région "Eldoria" et ayant un niveau supérieur à 30
select p.nom_PNJ, p.race, p.niveau 
from PNJ p
join Localisation l on p.id_localisation = l.id_localisation
where l.region = 'Eldoria' and p.niveau > 30;

-- Lister les quêtes où des PNJ d'une certaine race interviennent (ex: "Elfe") 
select distinct q.nom_quete 
from Quete q
join Intervenir i on q.id_quete = i.id_quete
join PNJ p on i.id_PNJ = p.id_PNJ
where p.race = 'Elfe';

-- Lister les PNJ qui ne participent à aucune quête
select p.nom_PNJ, p.race 
from PNJ p
left join Intervenir i on p.id_PNJ = i.id_PNJ
where i.id_quete is null;

-- Lister les PNJ qui participent à des quêtes de difficulté 5 et la region où ils se trouvent
select p.nom_PNJ, p.race, l.region 
from PNJ p
join Intervenir i on p.id_PNJ = i.id_PNJ
join Quete q on i.id_quete = q.id_quete
join Localisation l on p.id_localisation = l.id_localisation
where q.difficulte = 5;




-- group
-- Afficher la vitalité moyenne des PNJ par race
select race, avg(vitalite) as vitalite_moyenne 
from PNJ 
group by race;

-- Combien de PNJ sont intervenus dans chaque quête
select q.nom_quete, COUNT(i.id_PNJ) as nombre_PNJ 
from Quete q
left join Intervenir i on q.id_quete = i.id_quete
group by q.nom_quete;

-- Afficher les races de PNJ ayant plus de 5 représentants
select race, count(*) as nombre_PNJ 
from PNJ 
group by race 
having count(*) > 5; 

-- Les quêtes avec le nombre de PNJ intervenant dans chacune, triées par ordre décroissant
select q.nom_quete, count(i.id_PNJ) as nombre_PNJ 
from Quete q
left join Intervenir i on q.id_quete = i.id_quete
group by q.nom_quete 
order by nombre_PNJ desc; 


-- Les PNJ ayant la plus haute force par race
select race, MAX(`force`) as force_maximale 
from PNJ 
group by race;





-- negation 
-- Lister des PNJ qui n'ont jamais été des "Donneurs de quête"
select p.nom_PNJ, p.race 
from PNJ p
where p.id_PNJ not in (
    select i.id_PNJ 
    from Intervenir i 
    where i.role = 'Donneur de quête'
);


-- Lister les PNJ qui  n'ont jamais participé à une quête de type "Annexe"
select p.nom_PNJ, p.race 
from PNJ p
where p.id_PNJ not in (
    select i.id_PNJ 
    from Intervenir i
    join Quete q on i.id_quete = q.id_quete
    where q.type_quete = 'Annexe'
);


-- Lister les PNJ qui n'ont jamais participé à une quête de difficulté 5
select p.nom_PNJ, p.race 
from PNJ p
where p.id_PNJ not in (
    select i.id_PNJ 
    from Intervenir i
    join Quete q on i.id_quete = q.id_quete
    where q.difficulte = 5
);



-- division 
-- Lister les PNJ qui ont participé à toutes les quêtes de type "Principale"
select p.nom_PNJ 
from PNJ p
where not exists (
    select q.id_quete 
    from Quete q
    where q.type_quete = 'Principale'
    and not exists (
        select 1 
        from Intervenir i 
        where i.id_quete = q.id_quete and i.id_PNJ = p.id_PNJ
    )
);


-- Lister les PNJ qui ont participé à toutes les quêtes où "Elyndor" est intervenu
select p.nom_PNJ 
from PNJ p
where not exists (
    select i.id_quete 
    from Intervenir i
    where i.id_PNJ = (select id_PNJ from PNJ where nom_PNJ = 'Elyndor')
    and not exists  (
        select 1 
        from Intervenir i2 
        where i2.id_quete = i.id_quete and i2.id_PNJ = p.id_PNJ
    )
);








