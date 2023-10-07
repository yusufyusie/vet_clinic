/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

-----------------------------------------------
-----------------------------------------------
-- Add autoincremented PRIMARY KEY of id
ALTER TABLE animals
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
-- Add decimal places to two
ALTER TABLE animals
ALTER COLUMN weight_kg TYPE DECIMAL(10,2);

-- Add a column species of type string to your animals table. Modify your schema.sql file.?

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

-- Create a table named owners with the following columns

CREATE TABLE owners (
  id BIGSERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

-- Create a table named species with the following columns
CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

-- Modify animals table [Make sure that id is set as autoincremented PRIMARY KEY]

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INTEGER REFERENCES species(id);

ALTER TABLE animals 
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-------------------------------------------------
-------------------------------------------------

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    vet_id INT,
    vet_name VARCHAR(100),
    species_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_vet
    FOREIGN KEY (vet_id)
    REFERENCES vets (id)
    ON DELETE CASCADE,
    CONSTRAINT fk_species
    FOREIGN KEY (species_id)
    REFERENCES species (id)
    ON DELETE CASCADE
);