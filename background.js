// Minimal service worker for MedHelp

// Setup daily alarm for checking updates
chrome.runtime.onInstalled.addListener(() => {
  console.log("MedHelp Extension Installed");
  chrome.alarms.create("dataSyncAlarm", { periodInMinutes: 1440 }); // 24 hours
  syncData(); // First run
});

chrome.alarms.onAlarm.addListener((alarm) => {
  if (alarm.name === "dataSyncAlarm") {
    syncData();
  }
});

async function syncData() {
  try {
    // In production, these point to raw.githubusercontent.com URLs for your main branch
    // const CODE_URL = "https://raw.githubusercontent.com/HasanFerozQ/MedHelp/main/data/icd10_cpt_codes.json";
    // const PRICE_URL = "https://raw.githubusercontent.com/HasanFerozQ/MedHelp/main/data/cpt_medicare_prices.json";
    
    // Example fetch logic:
    // const codesData = await (await fetch(CODE_URL)).json();
    // const priceData = await (await fetch(PRICE_URL)).json();
    // await new Promise(resolve => chrome.storage.local.set({ bundled_codes: codesData, bundled_prices: priceData }, resolve));
    
    console.log("MedHelp Background Sync executed.");
  } catch (err) {
    console.error("Background sync failed:", err);
  }
}
