/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = FALSE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(*) AS num_escaped FROM animals WHERE escape_attempts > 0 GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

SELECT name AS Melody_animals FROM animals A 
JOIN owners O  ON A.owner_id  = O.id
WHERE O.full_name LIKE 'Melody Pond';

SELECT A.name AS Pokeman_animals FROM animals A 
JOIN species S ON A.species_id = S.id
WHERE S.name LIKE 'Pokemon';

SELECT full_name AS owner, name AS animal_name 
FROM animals A 
FULL JOIN owners O  ON A.owner_id  = O.id;

SELECT S.name AS species, COUNT(*) FROM animals A 
JOIN species S ON A.species_id = S.id
GROUP BY S.name;

SELECT A.name AS Digimon_animals FROM animals A 
LEFT JOIN owners O  ON A.owner_id  = O.id
LEFT JOIN species S ON A.species_id = S.id
WHERE O.full_name LIKE 'Jennifer Orwell' 
AND S.name LIKE 'Digimon';

SELECT name FROM animals A 
LEFT JOIN owners O  ON A.owner_id  = O.id
WHERE O.full_name LIKE 'Dean Winchester' 
AND A.escape_attempts = 0;

SELECT O.full_name, COUNT(A.name) FROM animals A 
JOIN owners O  ON A.owner_id  = O.id
GROUP BY O.full_name ORDER BY COUNT(A.name)
DESC LIMIT 1;

SELECT A.name  FROM animals A
JOIN visits V ON A.id = V.animals_id 
JOIN vets T ON V.vets_id = T.id
WHERE T.name LIKE 'William Tatcher'
ORDER BY V.date_of_visit DESC LIMIT 1;

SELECT COUNT(A.name)  FROM animals A
JOIN visits V ON A.id = V.animals_id 
JOIN vets T ON V.vets_id = T.id
WHERE T.name LIKE 'Stephanie Mendez';

SELECT V.name AS vet_name, S.name AS species_name FROM species S
FULL JOIN specializations Z ON S.id = Z.species_id 
FULL JOIN vets V ON Z.vet_id = V.id;

SELECT A.name FROM animals A
JOIN visits V ON A.id = V.animals_id 
JOIN vets T ON V.vets_id = T.id
WHERE T.name LIKE 'Stephanie Mendez'
AND V.date_of_visit BETWEEN '2020-04-01' AND '2020-08-01';

SELECT A.name, COUNT(V.date_of_visit) FROM animals A
JOIN visits V ON A.id = V.animals_id GROUP BY A.name
ORDER BY COUNT(V.date_of_visit) DESC LIMIT 1;

SELECT A.name FROM animals A
JOIN visits V ON A.id = V.animals_id JOIN vets T ON
V.vets_id = T.id WHERE T.name LIKE 'Maisy Smith'
ORDER BY V.date_of_visit ASC LIMIT 1;

SELECT A.name AS animal_name, A.date_of_birth, A.escape_attempts,
A.neutered, A.weight_kg, T.name AS vet_name, T.age AS vet_age,
T.date_of_graduation AS vets_garduation_date, V.date_of_visit 
FROM animals A JOIN visits V ON A.id = V.animals_id JOIN vets T ON
V.vets_id = T.id ORDER BY V.date_of_visit DESC LIMIT 1;

SELECT T.name, COUNT(V.date_of_visit) FROM visits V
FULL JOIN vets T ON V.vets_id = T.id FULL JOIN specializations S ON
T.id = S.vet_id WHERE S.species_id IS NULL
 GROUP BY T.name;

 SELECT S.name FROM visits V
JOIN vets T ON V.vets_id = T.id
JOIN animals A ON A.id = V.animals_id
JOIN species S ON A.species_id = S.id
WHERE T.name LIKE 'Maisy Smith' GROUP BY S.name
ORDER BY COUNT(S.name) DESC LIMIT 1;
