-- ========================================
-- VISTE PER IL DATABASE prof_privato
-- ========================================

USE prof_privato;

-- ========================================
-- 1. VISTA: Lezioni in una specifica data
-- ========================================
-- Mostra tutte le lezioni con possibilità di filtrare per data
-- Uso: SELECT * FROM vista_lezioni_giorno WHERE Data = '2025-10-17';

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
ORDER BY L.StartDate, L.StartTime;


-- ========================================
-- 2. VISTA: Lezioni per orario specifico
-- ========================================
-- Mostra tutte le lezioni che iniziano a un orario preciso
-- Uso: SELECT * FROM vista_lezioni_orario WHERE Orario = '15:00:00';

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
ORDER BY L.StartTime, L.StartDate;


-- ========================================
-- 3. VISTA: Tutte le lezioni di una materia
-- ========================================
-- Mostra tutte le lezioni per una specifica materia
-- Uso: SELECT * FROM vista_lezioni_materia WHERE Materia = 'Matematica';

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
ORDER BY SUB.SubjectName, L.StartDate, L.StartTime;


-- ========================================
-- 4. VISTA: Tutte le lezioni di uno studente
-- ========================================
-- Mostra tutte le lezioni di un singolo studente
-- Uso: SELECT * FROM vista_lezioni_studente WHERE Studente LIKE '%Rossi%';

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
ORDER BY S.LastName, S.FirstName, L.StartDate, L.StartTime;


-- ========================================
-- 5. VISTA: Lezioni per categoria tariffaria
-- ========================================
-- Mostra tutte le lezioni di una specifica categoria
-- Uso: SELECT * FROM vista_lezioni_categoria WHERE Categoria = 'Liceo Scientifico';

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
ORDER BY C.CategoryStudent, L.StartDate, L.StartTime;


-- ========================================
-- 6. VISTA: Lezioni senza pagamento
-- ========================================
-- Mostra tutte le lezioni non ancora pagate con importo atteso

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


-- ========================================
-- 7. VISTA: Registro lezioni-pagamenti
-- ========================================
-- Mostra chi ha pagato ogni lezione

CREATE OR REPLACE VIEW vista_registro_pagamenti AS
SELECT 
    L.LessonID,
    L.StartDate AS DataLezione,
    L.StartTime AS OrarioLezione,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    SUB.SubjectName AS Materia,
    C.Price AS TariffaLezione,
    CASE 
        WHEN L.PaymentID IS NULL THEN 'NON PAGATA'
        ELSE 'PAGATA'
    END AS StatoPagamento,
    P.PaymentDate AS DataPagamento,
    CONCAT(PAY.FirstName, ' ', PAY.LastName) AS Pagante,
    P.Amount AS ImportoPagamento,
    P.PaymentMethod AS MetodoPagamento
FROM Lesson L
JOIN Student S ON L.StudentID = S.StudentID
JOIN Subject SUB ON L.SubjectID = SUB.SubjectID
JOIN Category C ON L.CategoryID = C.CategoryID
LEFT JOIN Payment P ON L.PaymentID = P.PaymentID
LEFT JOIN Payer PAY ON P.PayerID = PAY.PayerID
ORDER BY L.StartDate, L.StartTime;


-- ========================================
-- 8. VISTA: Fatturato mensile aggregato
-- ========================================
-- Mostra il fatturato totale per ogni mese

CREATE OR REPLACE VIEW vista_fatturato_mensile AS
SELECT 
    YEAR(P.PaymentDate) AS Anno,
    MONTH(P.PaymentDate) AS Mese,
    DATE_FORMAT(P.PaymentDate, '%Y-%m') AS AnnoMese,
    COUNT(DISTINCT P.PaymentID) AS NumeroPagamenti,
    COUNT(L.LessonID) AS LezioniPagate,
    SUM(P.Amount) AS FatturatoTotale,
    AVG(P.Amount) AS MediaPagamento
FROM Payment P
LEFT JOIN Lesson L ON P.PaymentID = L.PaymentID
GROUP BY YEAR(P.PaymentDate), MONTH(P.PaymentDate), DATE_FORMAT(P.PaymentDate, '%Y-%m')
ORDER BY Anno DESC, Mese DESC;


-- ========================================
-- 9. VISTA: Situazione economica per pagante
-- ========================================
-- Mostra totale atteso, totale pagato e saldo per ogni pagante

CREATE OR REPLACE VIEW vista_situazione_pagante AS
SELECT 
    PAY.PayerID,
    CONCAT(PAY.FirstName, ' ', PAY.LastName) AS Pagante,
    PAY.PhoneNumber AS Telefono,
    PAY.Email,
    COUNT(DISTINCT L.LessonID) AS NumeroLezioni,
    SUM(C.Price) AS TotaleAtteso,
    COALESCE(SUM(P.Amount), 0) AS TotalePagato,
    SUM(C.Price) - COALESCE(SUM(P.Amount), 0) AS Saldo
FROM Payer PAY
LEFT JOIN Payment P ON PAY.PayerID = P.PayerID
LEFT JOIN Lesson L ON P.PaymentID = L.PaymentID
LEFT JOIN Category C ON L.CategoryID = C.CategoryID
GROUP BY PAY.PayerID, PAY.FirstName, PAY.LastName, PAY.PhoneNumber, PAY.Email
ORDER BY Saldo DESC;


-- ========================================
-- 10. VISTA: Analisi per studente
-- ========================================
-- Mostra statistiche per ogni studente

CREATE OR REPLACE VIEW vista_analisi_studente AS
SELECT 
    S.StudentID,
    CONCAT(S.FirstName, ' ', S.LastName) AS Studente,
    S.City AS Città,
    S.PhoneNumber AS Telefono,
    COUNT(L.LessonID) AS NumeroLezioni,
    MAX(L.StartDate) AS DataUltimaLezione
FROM Student S
LEFT JOIN Lesson L ON S.StudentID = L.StudentID
GROUP BY S.StudentID, S.FirstName, S.LastName, S.City, S.PhoneNumber
ORDER BY NumeroLezioni DESC;