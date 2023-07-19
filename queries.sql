/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = FALSE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(*) AS num_escaped FROM animals WHERE escape_attempts > 0 GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals 
SET owner_id = 
    CASE 
        WHEN name LIKE 'Agumon' THEN 1 
        WHEN name LIKE 'Gabumon' OR name LIKE 'Pikachu' THEN 2
        WHEN name LIKE 'Devimon' OR name LIKE 'Plantmon' THEN 3
        WHEN name LIKE 'Charmander' OR name LIKE 'Squirtle' OR name LIKE 'Blossom' THEN 4
        WHEN name LIKE 'Angemon' OR name LIKE 'Boarmon' THEN 5 
    END;
