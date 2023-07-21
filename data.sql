/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon','2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    ('Charmander', '2020-02-08', 0, false, -11.0),
    ('Plantmon', '2021-11-15', 2, true, -5.7),
    ('Squirtle', '1993-04-02', 3, false, -12.13),
    ('Angemon', '2005-06-12', 1, true, -45.0),
    ('Boarmon', '2005-06-07', 7, true, 20.4),
    ('Blossom', '1998-10-13', 3, true, 17.0),
    ('Ditto', '2022-05-14', 4, true, 22.0);

INSERT INTO owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name)
    VALUES('Pokemon'), ('Digimon');

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

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

INSERT INTO vets (name, age, date_of_graduation)
    VALUES('William Tatcher', 45, '2000-04-23'),
        ('Maisy Smith', 26, '2019-01-17'),
        ('Stephanie Mendez', 64, '1981-05-04'),
        ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (species_id, vet_id)
    VALUES(1, 1), (1, 3), (2, 3), (2, 4);

INSERT INTO visits (animals_id, vets_id, date_of_visit)
    VALUES(1, 1, '2020-05-24'), 
            (1, 3, '2020-07-22'),
            (2, 4, '2021-02-02'),
            (3, 2, '2020-01-05'),
            (3, 2, '2020-03-08'),
            (3, 2, '2020-05-14'),
            (4, 3, '2021-05-04'),
            (5, 4, '2021-02-24'),
            (6, 2, '2019-12-21'),
            (6, 1, '2020-08-10'),
            (6, 2, '2021-04-07'),
            (7, 3, '2019-09-29'),
            (8, 4, '2020-10-03'),
            (8, 4, '2020-11-04'),
            (9, 2, '2019-01-24'),
            (9, 2, '2019-05-15'),
            (9, 2, '2020-02-27'),
            (9, 2, '2020-08-03'),
            (10, 3, '2020-05-24'),
            (10, 1, '2021-01-11');
