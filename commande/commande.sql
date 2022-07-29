/*renvoie la liste des nuances selon le monde par nombre de voix, et de siege remportés*/
SELECT `Nuance agrégée par Le Monde`, SUM(gouv2.voix) as voix,SUM(gouv2.voix)*100/22744708 as "score%",SUM(gouv2.voix)*100/22744708*5.77 as SiegeSiProportionelle FROM monde 
INNER JOIN gouv2 ON monde.Nom=gouv2.nom AND monde.Prénom=gouv2.prenom AND monde.`Nuance Ministère`=gouv2.nuance 
GROUP BY `Nuance agrégée par Le Monde` ORDER BY voix


/*renvoie la liste des nuances selon le monde par nombre de voix, et de siege remportés*/
SELECT `Nuance agrégée par Le Monde`, SUM(gouv2.voix) as voix,SUM(gouv2.voix)*100/22744708 as "score%",SUM(gouv2.voix)*100/22744708*5.77 as SiegeSiProportionelle FROM monde 
INNER JOIN gouv2 ON monde.Nom=gouv2.nom AND monde.Prénom=gouv2.prenom AND monde.`Nuance Ministère`=gouv2.nuance 
GROUP BY `Nuance agrégée par Le Monde` ORDER BY voix


/*renvoie la liste des parties, par voix et le nombre de siege remportés*/
SELECT nuancefilles.nomMere as "partie", sum(gouv2.voix) as "voix", count(circonscription.nuance) as "siege"FROM `monde`
inner join unitedpartiestable on monde.id=unitedpartiestable.monde_id
inner join nuancefilles on nuancefilles.nomFille=unitedpartiestable.nameParty
inner join gouv2 on monde.Nom=gouv2.nom and monde.Prénom=gouv2.prenom and monde.`Nuance Ministère`=gouv2.nuance
left join circonscription on gouv2.nom=circonscription.nom and gouv2.prenom=circonscription.prenom and gouv2.nuance=circonscription.nuance
GROUP by nuancefilles.nomMere
order by sum(gouv2.voix)


/*renvoie la liste des partis d'un groupe et leur stat*/

SELECT unitedpartiestable.nameParty  as "partie", sum(gouv2.voix) as "voix", count(circonscription.nuance) as "siege" FROM `monde`
inner join unitedpartiestable on monde.id=unitedpartiestable.monde_id
inner join gouv2 on monde.Nom=gouv2.nom and monde.Prénom=gouv2.prenom and monde.`Nuance Ministère`=gouv2.nuance
left join circonscription on gouv2.nom=circonscription.nom and gouv2.prenom=circonscription.prenom and gouv2.nuance=circonscription.nuance
where unitedpartiestable.nameParty like "%RPS"
group by unitedpartiestable.nameParty  
ORDER BY `voix` ASC
