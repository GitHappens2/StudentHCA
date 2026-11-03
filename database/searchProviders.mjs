// search providers
export async function searchProviders(supabase, filters = {}) {
    const { insurance, careType, city, minRating } = filters;
    let rating;
    if (minRating != null && String(minRating).trim() !== "") {
        rating = Number(minRating);
        if (!["number", "string"].includes(typeof minRating) ||
            !Number.isFinite(rating) || rating < 0 || rating > 5) {
            throw new RangeError("Minimum rating must be between 0 and 5.");
        }
    }

    let query = supabase
        .from("provider_search")
        .select("provider_id, provider_name, city, rating");

    const textFilters = [
        ["insurance_plans", insurance],
        ["care_types", careType],
    ];
    for (const [column, value] of textFilters) {
        if (value?.trim()) {
            query = query.contains(column, [value.trim()]);
        }
    }
    if (city?.trim()) {
        query = query.eq("city", city.trim());
    }
    if (rating !== undefined) {
        query = query.gte("rating", rating);
    }

    const { data, error } = await query.order("provider_id").limit(25);
    if (error) throw error;
    return data ?? [];
}
