require('dotenv').config();
const fs = require('fs');
const csv = require('csv-parser');
const { createClient } = require('@supabase/supabase-js');

// Must be provided in .env
const SUPABASE_URL = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY; // Requires full bypass rights

if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY) {
    console.error("Missing SUPABASE_URL or SUPABASE_SERVICE_KEY in .env");
    process.exit(1);
}

const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);

const FILE_PATH = './data/ncci_ptp.csv';
const BATCH_SIZE = 10000; 

async function run() {
    if (!fs.existsSync(FILE_PATH)) {
        console.error(`ERROR: Cannot find ${FILE_PATH}. Download the CMS NCCI CSV and place it here.`);
        process.exit(1);
    }

    console.log("Starting NCCI PTP Edit ingestion...");
    let batch = [];
    let totalProcessed = 0;

    return new Promise((resolve, reject) => {
        fs.createReadStream(FILE_PATH)
            .pipe(csv({ skipLines: 6 })) // Official CSVs have a multi-line AMA preamble
            .on('data', async (row) => {
                const col1 = row['Column 1'] || row['Column1'];
                const col2 = row['Column 2'] || row['Column2'];
                const mod = row['Modifier'] || row['0=not allowed'] || '0';

                // Skip malformed rows
                if (!col1 || !col2) return;

                batch.push({
                    column1_code: col1.trim().toUpperCase(),
                    column2_code: col2.trim().toUpperCase(),
                    modifier_allowed: mod.substring(0, 1)
                });

                if (batch.length >= BATCH_SIZE) {
                    const currentBatch = [...batch];
                    batch = [];
                    totalProcessed += currentBatch.length;
                    
                    console.log(`Uploading batch of ${currentBatch.length}... (Total: ${totalProcessed})`);
                    
                    try {
                        const { error } = await supabase.from('ncci_ptp_edits').upsert(currentBatch, { onConflict: 'column1_code,column2_code' });
                        if (error) console.error('Batch upload error:', error.message);
                    } catch (e) {
                        console.error('Network/DB error:', e.message);
                    }
                }
            })
            .on('end', async () => {
                if (batch.length > 0) {
                    totalProcessed += batch.length;
                    console.log(`Uploading final batch... (Total: ${totalProcessed})`);
                    const { error } = await supabase.from('ncci_ptp_edits').upsert(batch, { onConflict: 'column1_code,column2_code' });
                    if (error) console.error('Final batch upload error:', error.message);
                }
                console.log("NCCI PTP Edits Ingestion Complete! Total Pairs:", totalProcessed);
                resolve();
            });
    });
}

run();
