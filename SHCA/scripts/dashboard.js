import {supabase} from './supabaseClient.js';

//search clinics by city, shows provider, specialty, and category
async function searchClinics(city) {
    const { data, error } = await supabase
        .from('clinics')
        .select(`
            name,address,city,phone,
            providers(
                name,
                specialties(specialty_name,categories( name ))
            )
        `)
        .eq('city', city)
        .order('name');
    if (error) {
        console.error('supabase error:', error);
        return [];
    }
    return data;
}

//sets up results to be used in <div id="results"> in dashboard.html
function displayClinics(clinics) {
    const container = document.getElementById('results');
    container.innerHTML = ''; // Clear previous results
    
    if (clinics.length === 0) {
        container.textContent = 'No clinics found in this city.';
        return;
    }
    for(const clinic of clinics) {
        const card = document.createElement('div');
        card.className = 'clinic-card';

        const title = document.createElement('h3');
        title.textContent = clinic.name;

        const info = document.createElement('p');
        info.textContent = `Address: ${clinic.address}, ${clinic.city} | Phone: ${clinic.phone ?? 'N/A'}`;

        const list = document.createElement('ul');
        for(const p of clinic.providers) {
            const li = document.createElement('li');
            li.textContent = `${p.name} - ${p.specialties?.specialty_name ?? 'No specialty'}`;
            list.append(li);
        }
        card.append(title, info, list);
        container.appendChild(card);
    }
}

//when user submits the search form, get the city and search for clinics
const input = document.querySelector('.searchfunction input');
input.addEventListener('keydown', async (event) => {
    if (event.key === 'Enter') {
        const clinics = await searchClinics(input.value.trim());
        displayClinics(clinics);
    }
});