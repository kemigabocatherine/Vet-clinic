/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id int PRIMARY KEY,
  name varchar(100),
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal
);

ALTER TABLE animals
ADD species varchar(100);

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name varchar(50),
  age int
);

CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name varchar(50)
);

ALTER TABLE animals
DROP COLUMN id;
ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id int references species(id);

ALTER TABLE animals
ADD COLUMN owner_id int REFERENCES owners(id);

