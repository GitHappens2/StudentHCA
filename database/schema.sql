--categories like (primary care, dental care, mental health, etc)
CREATE TABLE categories (
  category_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT
);

--specific to doctors/providers what do they excel in (eg. optometry )
CREATE TABLE specialties(
  specialty_id serial PRIMARY KEY,
  specialty_name TEXT NOT NULL UNIQUE,
  description TEXT,
  category_id INT REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE TABLE clinics(
  clinic_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  city TEXT NOT NULL,
  phone TEXT,
  website TEXT
);
-- doc info
CREATE TABLE providers(
  provider_id SERIAL PRIMARY KEY,
  clinic_id INT NOT NULL REFERENCES clinics(clinic_id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  specialty_id INT REFERENCES specialties(specialty_id) ON DELETE SET NULL
);
