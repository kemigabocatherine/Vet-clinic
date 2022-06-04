/*Queries that provide answers to the questions from all projects.*/
/* animals */
SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Update species column */
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';
UPDATE animals
SET species = 'pokemon'
WHERE species = '';
COMMIT;

/* Delete all table content */
BEGIN;
TRUNCATE animals;
ROLLBACK;

BEGIN;
DELETE FROM animals 
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts =0;
SELECT AVG(weight_kg) FROM animals;

SELECT neutered FROM animals
WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);

SELECT species, MIN(weight_kg), MAX(weight_kg) 
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth > '1990-12-31' AND date_of_birth < '2000-01-01'
GROUP BY species;

/* Animals owned by Melody */

SELECT name FROM animals
JOIN owners
ON owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

/* Animals of pokemon type */

SELECT animals.name FROM animals
JOIN species
ON species_id = species.id
WHERE species.id = 1;

/* All animals and their owners */

SELECT animals.name, owners.full_name FROM animals
FULL JOIN owners
ON owner_id = owners.id;

/* Animals per specie */

SELECT species.name, COUNT(*) FROM animals
JOIN species
ON species_id = species.id
GROUP BY species.id;

/* Digimon owned by Jennifer Orwell */

SELECT animals.name FROM animals
JOIN owners
ON owner_id = owners.id
JOIN species
ON species_id = species.id
WHERE species.id = '2' AND owners.full_name = 'Jennifer Orwell';

/* Animals owned by Dean Winchester with O escape_attempts */

SELECT animals.name FROM animals
JOIN owners
ON owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

/* Owns the most aniamls */
SELECT * FROM animals;
SELECT owners.full_name FROM animals
JOIN owners
ON owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(owner_id) DESC
LIMIT 1;

/* Last animal seen by Vet William Tatcher */

SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visit_date DESC;

/* Number of animals seen by Vet Stephanie Mendez */

SELECT COUNT(animals.name) FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

/* vets and their specialties, including vets with no specialties. */
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;

/* Animals that visited Vet Stephanie Mendez between Apr 1st and Aug 30, 2020 */
SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visit_date >= '2020-04-01' AND visit_date <= '2020-08-30';

/* Animal with most visits to vet */
SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(visits.animal_id) DESC
LIMIT 1;

/* Maisy Smith's first visit */
SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date ASC
LIMIT 1;

/* Details for most recent visit */

SELECT animals.*, vets.*, visit_date FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visit_date DESC
LIMIT 1;

/*  Number of visits with a vet that did not specialize in that animal's species */
SELECT COUNT(*) FROM visits 
JOIN vets ON visits.vet_id = vets.id 
JOIN animals ON visits.animal_id = animals.id 
WHERE vets.id NOT IN (SELECT vets.id FROM vets 
JOIN specializations ON vets.id = specializations.vet_id 
WHERE specializations.species_id = animals.species_id);


/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT species.name, COUNT(species.name) FROM vets
JOIN visits ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;