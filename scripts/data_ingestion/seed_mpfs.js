require('dotenv').config();
const fs = require('fs');
const csv = require('csv-parser');
const { createClient } = require('@supabase/supabase-js');

// Must be provided in .env
const SUPABASE_URL = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY; // Service key needed to bypass RLS

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error("Missing SUPABASE_URL or SUPABASE_SERVICE_KEY in .env");
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

const FILE_PATH = './data/mpfs.csv';
const BATCH_SIZE = 5000;

async function run() {
    if (!fs.existsSync(FILE_PATH)) {
        console.error(`ERROR: Cannot find ${FILE_PATH}.`);
        process.exit(1);
    }

    console.log("Starting MPFS Base Price ingestion...");
    let batch = [];
    let totalProcessed = 0;

    // The script now skips the first line of the Addendum B report
    return new Promise((resolve, reject) => {
        fs.createReadStream(FILE_PATH)
            .pipe(csv({ skipLines: 1 })) 
            .on('data', async (row) => {
                const cptCode = row['CPT1/HCPCS'] || row['CPT1/\nHCPCS'] || row['HCPCS'];
                if (!cptCode || cptCode.length > 5 || cptCode.includes('Addendum')) return; 

                // Addendum B uses RVU components to calculate National Price. 
                // Formula: (Work RVU + Facility PE RVU + Malpractice RVU) * Conversion Factor (approx 32.74 for 2024-2025)
                const workRVU = parseFloat(row['Work\nRVUs2'] || row['Work RVUs2']) || 0;
                const peRVU = parseFloat(row['Facility\nPE\nRVUs2'] || row['Facility PE RVUs2']) || 0;
                const mpRVU = parseFloat(row['Mal-\npractice\nRVUs2'] || row['Mal-practice RVUs2']) || 0;
                
                // If the direct amount is not in the CSV, we estimate using the standard conversion factor
                const estimatedPrice = (workRVU + peRVU + mpRVU) * 32.74;

                batch.push({
                    cpt_code: cptCode.trim().toUpperCase(),
                    description: (row['DESCRIPTION'] || 'No description').substring(0, 500),
                    base_price: estimatedPrice || 0,
                    status_code: (row['Status'] || 'A').substring(0, 5),
                    rvu_work: workRVU,
                    year: 2026
                });

                if (batch.length >= BATCH_SIZE) {
                    const currentBatch = [...batch];
                    batch = [];
                    totalProcessed += currentBatch.length;
                    
                    // Pause stream while uploading
                    console.log(`Uploading batch of ${currentBatch.length}... (Total: ${totalProcessed})`);
                    
                    try {
                        const { error } = await supabase.from('cpt_medicare_fees').upsert(currentBatch, { onConflict: 'cpt_code' });
                        if (error) throw error;
                    } catch (e) {
                        console.error('Batch upload error:', e.message);
                    }
                }
            })
            .on('end', async () => {
                if (batch.length > 0) {
                    totalProcessed += batch.length;
                    console.log(`Uploading final batch... (Total: ${totalProcessed})`);
                    const { error } = await supabase.from('cpt_medicare_fees').upsert(batch, { onConflict: 'cpt_code' });
                    if (error) console.error('Final batch upload error:', error.message);
                }
                console.log("MPFS Ingestion Complete! Total Codes:", totalProcessed);
                resolve();
            });
    });
}

run();
