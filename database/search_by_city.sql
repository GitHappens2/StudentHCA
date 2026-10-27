SELECT
    c.name AS clinic_name,
    c.address,
    c.city,
    c.phone,
    p.name AS provider_name,
    s.specialty_name,
    cat.name AS category
FROM public.clinics c
JOIN public.providers p
    ON c.clinic_id = p.clinic_id
JOIN public.specialties s
    ON p.specialty_id = s.specialty_id
JOIN public.categories cat
    ON s.category_id = cat.category_id
WHERE c.city = 'Example: Denton'
ORDER BY c.name;
