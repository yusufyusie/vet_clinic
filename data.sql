/* Populate database with sample data. */
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
	(1, 'Agumon', '2020,02,03', 0, TRUE, 10.23),
	(2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
	(3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04),
	(4, 'Devimon', '2017-05-12', 5, TRUE, 11);

-------------------------------------------------
-------------------------------------------------

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, true, 22);

-------------------------------------------------
-------------------------------------------------

-- Insert the following data into the owners table

INSERT INTO owners (full_name, age) VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert the following data into the species table

INSERT INTO species (name) VALUES 
('Pokemon'),
('Digimon');

-- Modify your inserted animals so it includes the species_id value:

UPDATE animals
SET species_id = 
  CASE 
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END;

--   Modify your inserted animals to include owner information (owner_id)

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

-------------------------------------------------
-------------------------------------------------

INSERT INTO vets (name, age, date_of_graduation)
VALUES
	('William Tatcher', 45, '2000,04,23'),
	('Maisy Smith', 26, '2019,01,17'),
	('Stephanie Mendez', 64, '1981,05,04'),
	('Jack Harkness', 38, '2008,06,08');


  INSERT INTO specializations (vet_id, vet_name, species_id)
  VALUES
    (1,'William Tatcher', 2),
    (3,'Stephanie Mendez', 2),
    (4,'Jack Harkness', 1);

    INSERT INTO visits (vet_id, vet_name, animal_id, animal, date_of_visit)
VALUES
	(1, 'William Tatcher', 1, 'Agumon', '2020,05,24'),
	(3, 'Stephanie Mendez', 1, 'Agumon', '2020,07,22'),
	(4, 'Jack Harkness', 2, 'Gabumon', '2021,02,02'),
	(2, 'Maisy Smith', 3, 'Pikachu', '2020,01,05'),
	(2, 'Maisy Smith', 3, 'Pikachu', '2020,03,08'),
	(2, 'Maisy Smith', 3, 'Pikachu', '2020,05,14'),
	(3, 'Stephanie Mendez', 4, 'Devimon', '2021,05,04'),
	(4, 'Jack Harkness', 5, 'Charmander', '2021,02,24'),
	(2, 'Maisy Smith', 6, 'Plantmon', '2019,12,21'),
	(2, 'Maisy Smith', 6, 'Plantmon', '2020,08,10'),
	(1, 'William Tatcher', 6, 'Plantmon', '2021,04,07'),
	(3, 'Stephanie Mendez', 7, 'Squirtle', '2019,09,29'),
	(4, 'Jack Harkness', 8, 'Angemon', '2020,10,03'),
	(4, 'Jack Harkness', 8, 'Angemon', '2020,11,04'),
	(2, 'Maisy Smith', 9, 'Boarmon', '2019,01,24'),
	(2, 'Maisy Smith', 9, 'Boarmon', '2019,05,15'),
	(2, 'Maisy Smith', 9, 'Boarmon', '2020,02,27'),
	(2, 'Maisy Smith', 9, 'Boarmon', '2020,08,03'),
	(3, 'Stephanie Mendez', 10, 'Blossom', '2020,05,24'),
	(1, 'William Tatcher', 10, 'Blossom', '2021,01,11');

----------------------------------------------
----------------------------------------------

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';