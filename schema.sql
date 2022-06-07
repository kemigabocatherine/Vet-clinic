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

CREATE TABLE vets(
id SERIAL PRIMARY KEY,
name varchar(50),
age int,
date_of_graduation date
);

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  vet_id integer REFERENCES vets(id),
  species_id integer REFERENCES species(id)
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id integer REFERENCES animals(id),
  vet_id integer REFERENCES vets(id),
  visit_date date
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
create index visits_animalID_asc on visits(animal_id asc);
