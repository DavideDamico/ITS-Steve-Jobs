USE prof_privato;

-- 1. VISTA: Lezioni in una specifica data
-- Mostra tutte le lezioni con possibilità di filtrare per data
-- Uso: SELECT * FROM vista_lezioni_giorno;

CREATE OR REPLACE VIEW vista_lezioni_giorno AS
SELECT 
    L.LessonID,
    L.StartDate AS Data,
    L.StartTime AS Orario,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    SUB.SubjectName AS Materia,
    C.CategoryStudent AS Categoria,
    L.LessonType AS TipoLezione,
    C.Price AS Tariffa
FROM Lesson L
JOIN Student S ON L.StudentID = S.StudentID
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
JOIN Category C ON L.CategoryID = C.CategoryID
WHERE L.StartDate = "2025-09-07"
ORDER BY L.StartDate, L.StartTime;


-- 2. VISTA: Lezioni per orario specifico
-- Mostra tutte le lezioni che iniziano a un orario preciso
-- Uso: SELECT * FROM vista_lezioni_orario;

CREATE OR REPLACE VIEW vista_lezioni_orario AS
SELECT 
    L.LessonID,
    L.StartTime AS Orario,
    L.StartDate AS Data,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    SUB.SubjectName AS Materia,
    C.CategoryStudent AS Categoria,
    C.Price AS Tariffa
FROM Lesson L
JOIN Student S ON L.StudentID = S.StudentID
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
JOIN Category C ON L.CategoryID = C.CategoryID
WHERE L.StartTime = "18:00:00"
ORDER BY L.StartTime, L.StartDate;


-- 3. VISTA: Tutte le lezioni di una materia
-- Mostra tutte le lezioni per una specifica materia
-- Uso: SELECT * FROM vista_lezioni_materia;

CREATE OR REPLACE VIEW vista_lezioni_materia AS
SELECT 
    SUB.SubjectName AS Materia,
    L.LessonID,
    L.StartDate AS Data,
    L.StartTime AS Orario,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    C.CategoryStudent AS Categoria,
    C.Price AS Tariffa,
    L.LessonType AS TipoLezione
FROM Lesson L
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
JOIN Student S ON L.StudentID = S.StudentID
JOIN Category C ON L.CategoryID = C.CategoryID
WHERE SUB.SubjectName = "Matematica"
ORDER BY SUB.SubjectName, L.StartDate, L.StartTime;


-- 4. VISTA: Tutte le lezioni di uno studente
-- Mostra tutte le lezioni di un singolo studente
-- Uso: SELECT * FROM vista_lezioni_studente;

CREATE OR REPLACE VIEW vista_lezioni_studente AS
SELECT 
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    S.StudentID,
    L.LessonID,
    L.StartDate AS Data,
    L.StartTime AS Orario,
    SUB.SubjectName AS Materia,
    C.CategoryStudent AS Categoria,
    C.Price AS Tariffa,
    L.LessonType AS TipoLezione
FROM Student S
JOIN Lesson L ON S.StudentID = L.StudentID
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
JOIN Category C ON L.CategoryID = C.CategoryID
WHERE S.LastName = "Alonzi" AND S.FirstName = "Piermaria" 
ORDER BY S.LastName, S.FirstName, L.StartDate, L.StartTime;


-- 5. VISTA: Lezioni per categoria tariffaria
-- Mostra tutte le lezioni di una specifica categoria
-- Uso: SELECT * FROM vista_lezioni_categoria;

CREATE OR REPLACE VIEW vista_lezioni_categoria AS
SELECT 
    C.CategoryStudent AS Categoria,
    C.Price AS Tariffa,
    L.LessonID,
    L.StartDate AS Data,
    L.StartTime AS Orario,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    SUB.SubjectName AS Materia,
    L.LessonType AS TipoLezione
FROM Category C
JOIN Lesson L ON C.CategoryID = L.CategoryID
JOIN Student S ON L.StudentID = S.StudentID
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
WHERE C.CategoryStudent = "Liceo"
ORDER BY C.CategoryStudent, L.StartDate, L.StartTime;


-- 6. VISTA: Lezioni senza pagamento
-- Mostra tutte le lezioni non ancora pagate con importo atteso
-- Uso: SELECT * FROM vista_lezioni_non_pagate;

CREATE OR REPLACE VIEW vista_lezioni_non_pagate AS
SELECT 
    L.LessonID,
    L.StartDate AS Data,
    L.StartTime AS Orario,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    S.PhoneNumber AS TelefonoStudente,
    SUB.SubjectName AS Materia,
    C.CategoryStudent AS Categoria,
    C.Price AS ImportoAtteso,
    L.LessonType AS TipoLezione
FROM Lesson L
JOIN Student S ON L.StudentID = S.StudentID
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
JOIN Category C ON L.CategoryID = C.CategoryID
WHERE L.PaymentID IS NULL
ORDER BY L.StartDate, L.StartTime;


-- 7. VISTA: Registro lezioni-pagamenti
-- Mostra SOLO le lezioni che sono state pagate
-- Uso: SELECT * FROM vista_registro_pagamenti;

CREATE OR REPLACE VIEW vista_registro_pagamenti AS
SELECT 
    L.LessonID,
    L.StartDate AS DataLezione,
    L.StartTime AS OrarioLezione,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    S.PhoneNumber AS TelefonoStudente,
    SUB.SubjectName AS Materia,
    C.Price AS TariffaLezione,
    P.PaymentDate AS DataPagamento,
    P.Amount AS ImportoPagamento,
    P.PaymentMethod AS MetodoPagamento
FROM Lesson L
JOIN Student S ON L.StudentID = S.StudentID
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
JOIN Category C ON L.CategoryID = C.CategoryID
JOIN Payment P ON L.PaymentID = P.PaymentID
WHERE L.PaymentID IS NOT NULL
ORDER BY L.StartDate, L.StartTime;


-- 8. VISTA: Fatturato mensile aggregato
-- Mostra il fatturato mensile dell'anno corrente
-- Uso: SELECT * FROM vista_fatturato_mensile;

CREATE OR REPLACE VIEW vista_fatturato_mensile AS
SELECT 
    YEAR(P.PaymentDate) AS Anno,
    MONTH(P.PaymentDate) AS Mese,
    DATE_FORMAT(P.PaymentDate, '%Y-%m') AS AnnoMese,
    COUNT(DISTINCT P.PaymentID) AS NumeroPagamenti,
    COUNT(L.LessonID) AS LezioniPagate,
    SUM(P.Amount) AS FatturatoTotale,
    ROUND(AVG(P.Amount), 2) AS MediaPagamento
FROM Payment P
LEFT JOIN Lesson L ON P.PaymentID = L.PaymentID
WHERE YEAR(P.PaymentDate) = YEAR(CURDATE())
GROUP BY YEAR(P.PaymentDate), MONTH(P.PaymentDate), DATE_FORMAT(P.PaymentDate, '%Y-%m')
ORDER BY Anno DESC, Mese DESC;


-- 9. VISTA: Situazione economica per studente
-- Mostra SOLO gli studenti con saldo da pagare
-- Uso: SELECT * FROM vista_situazione_studente;

CREATE OR REPLACE VIEW vista_situazione_studente AS
SELECT 
    S.StudentID,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    S.PhoneNumber AS Telefono,
    S.City AS Città,
    COUNT(DISTINCT L.LessonID) AS NumeroLezioni,
    SUM(C.Price) AS TotaleAtteso,
    COALESCE(
        (SELECT SUM(P2.Amount) 
         FROM Payment P2 
         WHERE P2.StudentID = S.StudentID), 
        0
    ) AS TotalePagato,
    SUM(C.Price) - COALESCE(
        (SELECT SUM(P2.Amount) 
         FROM Payment P2 
         WHERE P2.StudentID = S.StudentID), 
        0
    ) AS Saldo
FROM Student S
LEFT JOIN Lesson L ON S.StudentID = L.StudentID
LEFT JOIN Category C ON L.CategoryID = C.CategoryID
WHERE L.LessonID IS NOT NULL
GROUP BY S.StudentID, S.FirstName, S.LastName, S.PhoneNumber, S.City
HAVING Saldo > 0
ORDER BY Saldo DESC;


-- 10. VISTA: Analisi per studente nel periodo
-- Mostra: numero lezioni, ore totali, materia più frequente, 
--         fascia oraria prevalente e data ultima lezione
-- Uso: SELECT * FROM vista_analisi_studente;

CREATE OR REPLACE VIEW vista_analisi_studente AS
SELECT 
    S.StudentID,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    S.City AS Città,
    S.PhoneNumber AS Telefono,
    COUNT(L.LessonID) AS NumeroLezioni,
    COUNT(L.LessonID) * 1.5 AS OreTotali,
    (SELECT SUB.SubjectName
     FROM Lesson L2
     JOIN Subject SUB ON L2.SubjectID = SUB.SubjectID
     WHERE L2.StudentID = S.StudentID
     GROUP BY SUB.SubjectName
     ORDER BY COUNT(*) DESC
     LIMIT 1
    ) AS MateriaFrequente,
    (SELECT L3.StartTime
     FROM Lesson L3
     WHERE L3.StudentID = S.StudentID
     GROUP BY L3.StartTime
     ORDER BY COUNT(*) DESC
     LIMIT 1
    ) AS FasciaOrariaPrevalente,
    MAX(L.StartDate) AS DataUltimaLezione
FROM Student S
LEFT JOIN Lesson L ON S.StudentID = L.StudentID
WHERE L.LessonID IS NOT NULL AND S.FirstName = "Piermaria" AND S.LastName = "Alonzi"
GROUP BY S.StudentID, S.FirstName, S.LastName, S.City, S.PhoneNumber
ORDER BY NumeroLezioni DESC;