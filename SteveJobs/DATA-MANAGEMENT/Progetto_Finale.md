# Attivitá finale Data Management, corso 34.

Sviluppa il sistema informatico per tenere traccia delle attività didattiche della Steve Jobs Academy!

#### -Sviluppa il conceptual model, tenendo in considerazione almeno le seguenti entità:
- Studente 
- Corso
- Unitá formativa
- Tutor
- Docente
- Sede
(No calendario assenze presenze dei singoli studenti!!!!)

-Trasformalo in diagramma er  
-Trascrivi il corrispondente script ddl per la creazione del db. lo script deve tenere in considerazione tutte le tabelle, e tutti i vincoli (PK, FK, UK, not NULL)  
-Popola il DB con uno script Faker, scritto in python (Fammi vedere lo script). 
Mantieni la voce delle materie come reali

Assicurati di hashare i campi opportuni!! SOLO PASSWORD

-Crea delle viste che:
1) Permettano di osservare la carriera di uno studente, uno studente alla volta 
2) Permettano di vedere gli esiti di una specifica materia, di uno specifico corso
3) Per ciascuna materia di ciascun corso calcolino la media del voto
4) Di tutti gli studenti della SJA, calcolino la media di tutti i loro voti (mettendoli in ordine discendente)
5) Una vista che mi mostri tutti gli studenti con età maggiore di 30 anni, ordinati per "merito accademico" e non per anzianità

-Crea almeno un user DB che abbia i privilegi per osservare le viste e niente altro

ATTENZIONE:
Come specificato sopra, il software deve seguire le attività didattiche, e niente altro:  
-NO CONTABILITÁ  
-NO FORNITURE E FORNITORI

MODALITÁ DI CONSEGNA:  
Ciascuno studente dovrá consegnare un singolo file .zip con all'interno i file di progettazione.drawio, il file per la popolazione faker.py. ed il file .sql del database giá popolato, con le viste e gli utenti creati.

Si RICHIEDE INOLTRE LA CONSEGNA DI UN FILE .PDF CON ALL'INTERNO DEGLI SCREENSHOT RIASSUNTIVI DELLE VARIE FASI DI PROGETTAZIONE DEL LAVORO