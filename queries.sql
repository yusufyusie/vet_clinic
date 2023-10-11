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

-- Who was the last animal seen by William Tatcher?

SELECT animal, date_of_visit from visits WHERE vet_name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?

SELECT vet_name, COUNT (DISTINCT animal) from visits GROUP BY vet_name HAVING vet_name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.

SELECT v.name, sp.name as speciality from vets v LEFT JOIN specializations s ON  v.id = s.vet_id
LEFT JOIN species sp ON s.species_id = sp.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT vet_name, animal, date_of_visit from visits WHERE vet_name = 'Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?

SELECT animal, COUNT(animal) as number_of_visits from visits GROUP BY animal ORDER BY COUNT(animal) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?

SELECT animal, date_of_visit from visits WHERE vet_name = 'Maisy Smith' ORDER BY date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT * from visits V LEFT join animals A on V.animal_id = A.id ORDER BY date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT V.vet_name, V.date_of_visit, A.name, A.species_id, S.species_id from visits V join animals A on V.animal_id = A.id Left join specializations S on V.vet_id = S.vet_id WHERE A.species_id = S.species_id OR S.species_id IS NULL ORDER BY date_of_visit DESC;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT V.vet_name, S.name as consider_specialalization_in, COUNT(S.name) as number_of_vsits from visits V join animals A on V.animal_id = A.id Left join species S on A.species_id = S.id WHERE V.vet_name = 'Maisy Smith' GROUP BY S.name, V.vet_name ORDER BY COUNT(S.name) DESC LIMIT 1;

--------------------------------------------
--------------------------------------------

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';