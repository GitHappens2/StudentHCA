-- enables Row Level Security on current tables
ALTER TABLE public.categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.specialties ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.clinics ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.providers ENABLE ROW LEVEL SECURITY;

-- allows users to read these tables but cannot insert,update, or delete
CREATE POLICY "Public read" ON public.categories FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public read" ON public.specialties FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public read" ON public.clinics FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "Public read" ON public.providers FOR SELECT TO anon, authenticated USING (true);