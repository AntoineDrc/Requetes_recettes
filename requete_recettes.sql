1- Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
de façon décroissante sur la durée de réalisation
SELECT * FROM recettes ORDER BY tempsPreparation;


2- En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.
SELECT nom, COUNT(id_ingredients) AS nombreIngredients
FROM recettes
-- Grâce à propriété commune "id_recettes" on établie un lien entre les deux tables qui nous donnes accès à toutes leurs propriétés
JOIN quantite ON recettes.id_recettes = quantite.id_recettes
GROUP BY recettes.nom
ORDER BY recettes.nom;


3- Afficher les recettes qui nécessitent au moins 30 min de préparation
SELECT *
FROM recettes 
-- WHERE filtes les résultat par la condition souhaitée
WHERE tempsPreparation >= "30";


4- Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en 
question)
SELECT *
FROM recettes
WHERE nom
LIKE '%salade%';

    
5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec 
les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de 
pouvoir lister les détails de cette recettes (ingrédients)
INSERT INTO recettes (nom, tempsPreparation, instructions)
VALUES ('PatesCarbo', '20', '');


6- Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre 
convenance)
UPDATE recettes 
SET nom = "nomModifie"
WHERE id_recettes = 3;


7- Supprimer la recette n°2 de la base de données
-- Pour supprimer une clé primaire, on doit d'abord supprimer les clés étrangères reférencée dans d'autres tables
DELETE FROM quantite
WHERE id_recettes = 10;

-- Suppression de la clé primaire
DELETE FROM recettes
WHERE id_recettes = 10;


8- Afficher le prix total de la recette n°5
SELECT SUM(ingredients.prix * quantite.quantite) AS prixTotal
FROM recettes 
-- On établi le lien entre la table "recettes" et "quantite" via "id_recettes"
JOIN quantite ON recettes.id_recettes = quantite.id_recettes
-- On établi le lien entre la table "quantite" et "ingredients" via "id_ingredients", donnant accès au propriétés des 3 tables nécessaire pour le calcul
JOIN ingredients ON quantite.id_ingredients = ingredients.id_ingredients 
WHERE recettes.id_recettes = 5;


9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)
SELECT ingredients.nom, quantite.quantite, ingredients.uniteMesure, ingredients.prix, (quantite.quantite * ingredients.prix) AS prixIngredients
FROM recettes 
JOIN quantite ON recettes.id_recettes = quantite.id_recettes
JOIN ingredients ON quantite.id_ingredients = ingredients.id_ingredients 
WHERE recettes.id_recettes = 5;


10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €
11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)
12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts
13- Afficher les recettes qui contiennent l’ingrédient « Poulet »
14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes 
15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure
16- Afficher la / les recette(s) les plus rapides à préparer
17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau 
chaude qui consiste à verser de l’eau chaude dans une tasse)
18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes
19- Ajouter un nouvel ingrédient à une recette spécifique
20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est 
donc exclu d’utiliser la clause LIMIT)

