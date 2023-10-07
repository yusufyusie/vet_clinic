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
-- Add utoincreament of id
ALTER TABLE animals
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

-- Add a column species of type string to your animals table. Modify your schema.sql file.?

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

ALTER TABLE animals
ALTER COLUMN weight_kg TYPE DECIMAL(10,2);