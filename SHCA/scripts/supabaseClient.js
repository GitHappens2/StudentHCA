// loads supacase client from CDN, so we don't have to install it in the project
import {createClient} from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm'; 

const supabaseUrl = 'https://vwxnrcipmqrhsnmtvlhi.supabase.co'; // Supabase URL
const supabaseKey = 'sb_publishable_9SO4H_a1GhUmX1uif0dzUA_SAW6FGOw'; //  Supabase anon/public key

export const supabase = createClient(supabaseUrl, supabaseKey);