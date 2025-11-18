/**
 * SCRIPT DI RESET DATI
 *
 * Resetta tutti i file JSON nella cartella data
 * Utile per ricominciare da zero durante lo sviluppo
 */

const fs = require("fs");
const path = require("path");

const dataDir = path.join(__dirname, "services/data");

const files = ["users.json", "albums.json", "images.json"];

const emptyData = {
  data: [],
  lastId: 0,
};

console.log("🔄 Resetting data files...\n");

files.forEach((file) => {
  const filePath = path.join(dataDir, file);
  try {
    fs.writeFileSync(filePath, JSON.stringify(emptyData, null, 2), "utf8");
    console.log(`✅ ${file} reset successfully`);
  } catch (error) {
    console.error(`❌ Error resetting ${file}:`, error.message);
  }
});

console.log("\n✨ All data files have been reset!");
console.log("📝 All arrays are empty and IDs start from 1");
