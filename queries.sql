/*Queries that provide answers to the questions from all projects.*/


SELECT * from animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.

SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.

SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".

SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.

SELECT * from animals WHERE neutered = TRUE;

-- Find all animals not named Gabumon.

SELECT * from animals WHERE name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-----------------------------------------------
-----------------------------------------------
-- Inside a transaction update the animals table by setting the species column to unspecified. 
BEGIN;

UPDATE animals
SET species = 'unspecified';

 SELECT species from animals

ROLLBACK;
SELECT species from animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL; 

SELECT species from animals;
COMMIT;

 SELECT species from animals;
 
SELECT * FROM animals

BEGIN;
DELETE FROM animals;
SELECT * FROM animals

ROLLBACK;
SELECT * FROM animals

BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO my_savepoint;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT * FROM animals

SELECT COUNT(*) FROM animals;

SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) as max_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY max_escape_attempts DESC
LIMIT 1;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) as avg_escape_attempts
FROM animals
WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31'
GROUP BY species;

-----------------------------------------------
-----------------------------------------------
-- What animals belong to Melody Pond?

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.id, animals.id;

-- How many animals are there per species?

SELECT species.name, COUNT(animals.id) AS num_animals
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.name
ORDER BY num_animals DESC;

-- List all Digimon owned by Jennifer Orwell.

SELECT  A.name, S.name, O.full_name FROM animals A 
JOIN species S ON A.species_id = S.id 
JOIN owners O ON A.owner_id = O.id 
WHERE S.name = 'Digimon' AND O.full_name= 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT  A.name, O.full_name FROM animals A 
JOIN owners O ON A.owner_id = O.id
WHERE A.escape_attempts = 0 AND O.full_name= 'Dean Winchester';

-- Who owns the most animals?


SELECT full_name, count FROM (SELECT O.full_name, count FROM (SELECT owner_id, COUNT(owner_id) FROM animals
GROUP BY owner_id) A JOIN owners O ON A.owner_id = O.id) AS J1 JOIN
(SELECT  MAX(count) as max FROM (SELECT owner_id, COUNT(owner_id) FROM animals
GROUP BY owner_id) C) AS J2 ON J1.count = J2.max;

--------------------------------------------
--------------------------------------------