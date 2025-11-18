# SQL Schema per Migrazione Database

Questa cartella contiene gli script SQL per migrare il progetto da storage JSON a MySQL.

## 📂 File Disponibili

### Versione Light (Consigliato)
- **schema-light.sql** - Schema semplificato con 3 tabelle (users, albums, images)
- Corrisponde all'architettura light del progetto (4 servizi)
- Ideale per iniziare la migrazione a DB



### Dati di Test
- **seed-data.sql** - Dati di esempio per testing (compatibile con schema completo)

## 🎯 Quando Usare

Questi script sono per la **Fase 2** del progetto, dopo aver completato le 2 consegne con storage JSON.

### Consiglio
👉 **Usa `schema-light.sql`** per le 2 consegne principali (Album + Image Service)

## 📊 Schema Light Database
