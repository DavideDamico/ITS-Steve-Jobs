-- ============================================
-- CREAZIONE UTENTE CON PRIVILEGI SOLO VISTE
-- ============================================
-- Questo script crea un utente che può SOLO visualizzare le viste
-- e non ha accesso alle tabelle originali del database

-- IMPORTANTE: Sostituisci 'stevejobs' con il nome del tuo database se diverso

-- ============================================
-- STEP 1: Creazione dell'utente
-- ============================================

-- Crea l'utente 'viewer_user' con password 'ViewOnly2024!'
-- Può connettersi solo da localhost
CREATE USER IF NOT EXISTS 'viewer_user'@'localhost' 
IDENTIFIED BY 'ViewOnly2024!';

-- ============================================
-- STEP 2: Revoca tutti i privilegi (pulizia)
-- ============================================

-- Assicurati che l'utente non abbia privilegi preesistenti
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'viewer_user'@'localhost';

-- ============================================
-- STEP 3: Concedi privilegi SOLO sulle viste
-- ============================================

-- Concedi SELECT SOLO sulle 5 viste create
GRANT SELECT ON stevejobs.Vista_Carriera_Studente TO 'viewer_user'@'localhost';
GRANT SELECT ON stevejobs.Vista_Esiti_Materia_Corso TO 'viewer_user'@'localhost';
GRANT SELECT ON stevejobs.Vista_Media_Voti_Materia_Corso TO 'viewer_user'@'localhost';
GRANT SELECT ON stevejobs.Vista_Classifica_Studenti TO 'viewer_user'@'localhost';
GRANT SELECT ON stevejobs.Vista_Studenti_Over30_Merito TO 'viewer_user'@'localhost';

-- ============================================
-- STEP 4: Applica le modifiche
-- ============================================

FLUSH PRIVILEGES;

-- ============================================
-- VERIFICA PRIVILEGI
-- ============================================

-- Mostra i privilegi dell'utente creato
SHOW GRANTS FOR 'viewer_user'@'localhost';

-- ============================================
-- TEST DI ACCESSO (esegui dopo aver fatto login con viewer_user)
-- ============================================

-- Questi comandi DEVONO funzionare:
-- SELECT * FROM Vista_Carriera_Studente;
-- SELECT * FROM Vista_Esiti_Materia_Corso;
-- SELECT * FROM Vista_Media_Voti_Materia_Corso;
-- SELECT * FROM Vista_Classifica_Studenti;
-- SELECT * FROM Vista_Studenti_Over30_Merito;

-- Questi comandi DEVONO fallire (Access Denied):
-- SELECT * FROM Student;
-- SELECT * FROM UserInfo;
-- INSERT INTO Student VALUES (...);
-- UPDATE Student SET ...;
-- DELETE FROM Student WHERE ...;
-- DROP TABLE Student;
-- CREATE TABLE Test (...);

-- ============================================
-- COME TESTARE L'UTENTE
-- ============================================

-- Metodo 1: Da terminale MySQL
-- mysql -u viewer_user -p stevejobs
-- Password: ViewOnly2024!

-- Metodo 2: Da phpMyAdmin
-- 1. Vai su phpMyAdmin
-- 2. Clicca su "Esci" se già loggato
-- 3. Login con:
--    - Username: viewer_user
--    - Password: ViewOnly2024!
--    - Server: localhost
-- 4. Seleziona database "stevejobs"
-- 5. Prova a fare SELECT sulle viste (OK)
-- 6. Prova a fare SELECT su Student (ERRORE)

-- ============================================
-- ELIMINARE L'UTENTE (se necessario)
-- ============================================

-- DROP USER IF EXISTS 'viewer_user'@'localhost';
-- FLUSH PRIVILEGES;

-- ============================================
-- CREARE UTENTI AGGIUNTIVI (opzionale)
-- ============================================

-- Esempio: Utente che può vedere solo Vista_Carriera_Studente
-- CREATE USER 'student_viewer'@'localhost' IDENTIFIED BY 'StudentView2024!';
-- GRANT SELECT ON stevejobs.Vista_Carriera_Studente TO 'student_viewer'@'localhost';
-- FLUSH PRIVILEGES;

-- Esempio: Utente che può accedere da qualsiasi host (NON RACCOMANDATO in produzione)
-- CREATE USER 'viewer_user'@'%' IDENTIFIED BY 'ViewOnly2024!';
-- GRANT SELECT ON stevejobs.Vista_Carriera_Studente TO 'viewer_user'@'%';
-- GRANT SELECT ON stevejobs.Vista_Esiti_Materia_Corso TO 'viewer_user'@'%';
-- GRANT SELECT ON stevejobs.Vista_Media_Voti_Materia_Corso TO 'viewer_user'@'%';
-- GRANT SELECT ON stevejobs.Vista_Classifica_Studenti TO 'viewer_user'@'%';
-- GRANT SELECT ON stevejobs.Vista_Studenti_Over30_Merito TO 'viewer_user'@'%';
-- FLUSH PRIVILEGES;

-- ============================================
-- NOTE IMPORTANTI
-- ============================================

-- 1. L'utente 'viewer_user' può SOLO fare SELECT sulle viste
-- 2. NON può vedere le tabelle originali (Student, UserInfo, etc.)
-- 3. NON può fare INSERT, UPDATE, DELETE, DROP su nulla
-- 4. NON può creare nuove tabelle o viste
-- 5. La password è 'ViewOnly2024!' - cambiarla per produzione!
-- 6. '@localhost' significa che può connettersi solo da locale
-- 7. Usa '@%' per permettere connessioni remote (sconsigliato)

-- ============================================
-- CREDENZIALI UTENTE CREATO
-- ============================================
-- Username: viewer_user
-- Password: ViewOnly2024!
-- Host: localhost
-- Database: stevejobs
-- Privilegi: SELECT solo su 5 viste
-- ============================================