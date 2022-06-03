/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (1, 'Agumon', 'Feb 3,2020', 0, TRUE, 10.23);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (2, 'Gabumon', 'Nov 15,2018', 2, TRUE, 8);


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (3, 'Pikachu', 'Jan 7,2021', 1, FALSE, 15.04);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES (4, 'Devimon', 'May 12,2017', 5, TRUE, 11);

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (5, 'Charmander', 'Feb 8,2020', 0, FALSE, -11, 'cat');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (6, 'Plantmon', 'Nov 15,2021', 2, TRUE, -5.7, 'cat');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (7, 'Squirtle', 'Apr 2, 1993', 3, FALSE, -12.13, 'cat');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (8, 'Angemon', 'Jun 12, 2005', 1, TRUE, -45, 'cat');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (9, 'Boarmon', 'Jun 7, 2005', 7, TRUE, 20.4, 'cat');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (10, 'Blossom', 'Oct 13, 1998', 3, TRUE, 17, 'cat');

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES (11, 'Ditto', 'May 14, 2022', 4, TRUE, 22, 'cat');

/* owners table */

INSERT INTO owners(full_name, age)
VALUES('Sam Smith', 34);


INSERT INTO owners(full_name, age)
VALUES('Jennifer Orwell', 19);

INSERT INTO owners(full_name, age)
VALUES('Bob', 45);

INSERT INTO owners(full_name, age)
VALUES('Melody Pond', 77);

INSERT INTO owners(full_name, age)
VALUES('Dean Winchester', 14);

INSERT INTO owners(full_name, age)
VALUES('Jodie Whittaker', 38);

/* species table */

INSERT INTO species(name)
VALUES('Pokemon');

INSERT INTO species(name)
VALUES('Digimon');

/* specie-animal relationship */
UPDATE animals 
SET species_id = 2
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = 1
WHERE species_id is NULL;

/* owner-animal relationship */
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';

