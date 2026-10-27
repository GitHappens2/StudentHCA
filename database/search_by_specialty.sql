SELECT
    c.name AS clinic_name,
    c.city,
    p.name AS provider_name,
    s.specialty_name
FROM public.clinics c
JOIN public.providers p
    ON c.clinic_id = p.clinic_id
JOIN public.specialties s
    ON p.specialty_id = s.specialty_id
WHERE s.specialty_name = 'Example: Family Medicine';
