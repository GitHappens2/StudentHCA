BEGIN;

-- Example treatment categories
INSERT INTO public.categories (name, description)
VALUES
('Example: Primary Care', 'Example: General medical services'),
('Example: Dental Care', 'Example: Dental treatment services'),
('Example: Mental Health', 'Example: Mental healthcare services');

-- Example specialties linked to categories
INSERT INTO public.specialties
    (specialty_name, description, category_id)
VALUES
('Example: Family Medicine', 'Example: General family healthcare',
 (SELECT category_id FROM public.categories
  WHERE name = 'Example: Primary Care')),

('Example: Internal Medicine', 'Example: Adult medical care',
 (SELECT category_id FROM public.categories
  WHERE name = 'Example: Primary Care')),

('Example: General Dentistry', 'Example: Dental examinations and treatments',
 (SELECT category_id FROM public.categories
  WHERE name = 'Example: Dental Care')),

('Example: Psychiatry', 'Example: Mental health treatment',
 (SELECT category_id FROM public.categories
  WHERE name = 'Example: Mental Health')),

('Example: Counseling', 'Example: Behavioral health counseling',
 (SELECT category_id FROM public.categories
  WHERE name = 'Example: Mental Health'));

-- Example clinics
INSERT INTO public.clinics
    (name, address, city, phone, website)
VALUES
('Example: Clinic 1', 'Example: 101 Test Street', 'Example: Denton',
 'Example: 202-555-0101', 'https://example.com/clinic1'),

('Example: Clinic 2', 'Example: 202 Test Avenue', 'Example: Denton',
 'Example: 202-555-0102', 'https://example.com/clinic2'),

('Example: Clinic 3', 'Example: 303 Test Road', 'Example: Denton',
 'Example: 202-555-0103', 'https://example.com/clinic3'),

('Example: Clinic 4', 'Example: 404 Test Boulevard', 'Example: Frisco',
 'Example: 202-555-0104', 'https://example.com/clinic4'),

('Example: Clinic 5', 'Example: 505 Test Lane', 'Example: Aubrey',
 'Example: 202-555-0105', 'https://example.com/clinic5');

-- Example providers connected to clinics and specialties
INSERT INTO public.providers
    (clinic_id, name, specialty_id)
VALUES
(
 (SELECT clinic_id FROM public.clinics WHERE name = 'Example: Clinic 1'),
 'Example: Doctor Name 1',
 (SELECT specialty_id FROM public.specialties
  WHERE specialty_name = 'Example: Family Medicine')
),
(
 (SELECT clinic_id FROM public.clinics WHERE name = 'Example: Clinic 2'),
 'Example: Doctor Name 2',
 (SELECT specialty_id FROM public.specialties
  WHERE specialty_name = 'Example: General Dentistry')
),
(
 (SELECT clinic_id FROM public.clinics WHERE name = 'Example: Clinic 3'),
 'Example: Doctor Name 3',
 (SELECT specialty_id FROM public.specialties
  WHERE specialty_name = 'Example: Psychiatry')
),
(
 (SELECT clinic_id FROM public.clinics WHERE name = 'Example: Clinic 4'),
 'Example: Doctor Name 4',
 (SELECT specialty_id FROM public.specialties
  WHERE specialty_name = 'Example: Internal Medicine')
),
(
 (SELECT clinic_id FROM public.clinics WHERE name = 'Example: Clinic 5'),
 'Example: Doctor Name 5',
 (SELECT specialty_id FROM public.specialties
  WHERE specialty_name = 'Example: Counseling')
);

COMMIT;
