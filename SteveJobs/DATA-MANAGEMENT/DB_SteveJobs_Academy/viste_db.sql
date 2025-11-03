

-- -- VISTA 1: Carriera di uno Studente Specifico
-- -- Mostra tutti i corsi frequentati dallo studente con StudentID = 42
-- -- con informazioni su iscrizione, completamento e location

-- CREATE OR REPLACE VIEW Vista_Carriera_Studente AS
-- SELECT 
--     s.StudentID,
--     CONCAT(ui.FirstName, ' ', ui.LastName) AS NomeCompleto,
--     ui.Email,
--     TIMESTAMPDIFF(YEAR, ui.BirthDate, CURDATE()) AS Eta,
--     c.CourseID,
--     m.ModuleName AS TipoCorso,
--     c.SchoolYear AS AnnoScolastico,
--     l.LocationName AS Sede,
--     ct.CityName AS Citta,
--     e.EnrollmentDate AS DataIscrizione,
--     e.CompletionDate AS DataCompletamento,
--     CASE 
--         WHEN e.CompletionDate IS NOT NULL THEN 'Completato'
--         ELSE 'In corso'
--     END AS StatoCorso,
--     c.TotalHour AS OreTotali
-- FROM 
--     Student s
--     INNER JOIN UserInfo ui ON s.UserInfoID = ui.UserInfoID
--     INNER JOIN Enrollment e ON s.StudentID = e.StudentID
--     INNER JOIN Course c ON e.CourseID = c.CourseID
--     INNER JOIN Module m ON c.CourseID = m.CourseID
--     INNER JOIN Location l ON c.LocationID = l.LocationID
--     INNER JOIN City ct ON l.CityID = ct.CityID
-- WHERE 
--     s.StudentID = 42
--     AND s.IsDeleted = 0 
--     AND ui.IsDeleted = 0 
--     AND e.IsDeleted = 0
--     AND c.IsDeleted = 0
-- GROUP BY 
--     s.StudentID, c.CourseID, m.ModuleName, c.SchoolYear, 
--     l.LocationName, ct.CityName, e.EnrollmentDate, e.CompletionDate, 
--     c.TotalHour, ui.FirstName, ui.LastName, ui.Email, ui.BirthDate
-- ORDER BY 
--     e.EnrollmentDate DESC;

-- -- Utilizzo: SELECT * FROM Vista_Carriera_Studente;


-- -- VISTA 2: Esiti di una Specifica Materia per un Corso Specifico
-- -- Mostra i voti di tutti gli studenti per la materia 'React' del CourseID = 15

-- CREATE OR REPLACE VIEW Vista_Esiti_Materia_Corso AS
-- SELECT 
--     c.CourseID,
--     m.ModuleName AS TipoCorso,
--     c.SchoolYear AS AnnoScolastico,
--     fu.UnitName AS Materia,
--     s.StudentID,
--     CONCAT(ui.FirstName, ' ', ui.LastName) AS NomeStudente,
--     v.FirstVote AS PrimoVoto,
--     v.SecondVote AS SecondoVoto,
--     v.FinalVote AS VotoFinale,
--     CASE 
--         WHEN v.FinalVote >= 6 THEN 'Sufficiente'
--         WHEN v.FinalVote < 6 AND v.FinalVote IS NOT NULL THEN 'Insufficiente'
--         ELSE 'Non valutato'
--     END AS Esito,
--     ms.State AS StatoModulo
-- FROM 
--     Course c
--     INNER JOIN Module m ON c.CourseID = m.CourseID
--     INNER JOIN FormativeUnit fu ON m.FormativeUnitID = fu.FormativeUnitID
--     INNER JOIN Vote v ON m.ModuleID = v.ModuleID
--     INNER JOIN Student s ON v.StudentID = s.StudentID
--     INNER JOIN UserInfo ui ON s.UserInfoID = ui.UserInfoID
--     INNER JOIN ModuleState ms ON m.ModuleStateID = ms.ModuleStateID
-- WHERE 
--     c.CourseID = 15
--     AND fu.UnitName = 'React'
--     AND c.IsDeleted = 0 
--     AND m.IsDeleted = 0 
--     AND v.IsDeleted = 0
--     AND s.IsDeleted = 0
-- ORDER BY 
--     v.FinalVote DESC;

-- -- Utilizzo: SELECT * FROM Vista_Esiti_Materia_Corso;


-- -- VISTA 3: Media Voti per Materia di ogni Corso
-- -- Calcola la media dei voti per ogni materia di ogni corso

-- CREATE OR REPLACE VIEW Vista_Media_Voti_Materia_Corso AS
-- SELECT 
--     c.CourseID,
--     m.ModuleName AS TipoCorso,
--     c.SchoolYear AS AnnoScolastico,
--     l.LocationName AS Sede,
--     fu.UnitName AS Materia,
--     CONCAT(t_ui.FirstName, ' ', t_ui.LastName) AS Docente,
--     COUNT(v.VoteID) AS NumeroStudentiValutati,
--     ROUND(AVG(v.FinalVote), 2) AS MediaVotoFinale,
--     ROUND(AVG(v.FirstVote), 2) AS MediaPrimoVoto,
--     ROUND(AVG(v.SecondVote), 2) AS MediaSecondoVoto,
--     MIN(v.FinalVote) AS VotoMinimo,
--     MAX(v.FinalVote) AS VotoMassimo,
--     ms.State AS StatoModulo
-- FROM 
--     Course c
--     INNER JOIN Module m ON c.CourseID = m.CourseID
--     INNER JOIN FormativeUnit fu ON m.FormativeUnitID = fu.FormativeUnitID
--     INNER JOIN ModuleState ms ON m.ModuleStateID = ms.ModuleStateID
--     INNER JOIN Teacher t ON m.TeacherID = t.TeacherID
--     INNER JOIN UserInfo t_ui ON t.UserInfoID = t_ui.UserInfoID
--     INNER JOIN Location l ON c.LocationID = l.LocationID
--     LEFT JOIN Vote v ON m.ModuleID = v.ModuleID AND v.IsDeleted = 0
-- WHERE 
--     c.IsDeleted = 0 
--     AND m.IsDeleted = 0
-- GROUP BY 
--     c.CourseID, m.ModuleName, c.SchoolYear, l.LocationName, 
--     fu.UnitName, t_ui.FirstName, t_ui.LastName, ms.State
-- HAVING 
--     COUNT(v.VoteID) > 0
-- ORDER BY 
--     c.CourseID, fu.UnitName;

-- -- Esempio di utilizzo con filtro specifico:
-- -- SELECT * FROM Vista_Media_Voti_Materia_Corso WHERE CourseID = 10;


-- -- VISTA 4: Classifica Generale Studenti per Media Voti
-- -- Calcola la media di tutti i voti di ogni studente (ordine discendente)

-- CREATE OR REPLACE VIEW Vista_Classifica_Studenti AS
-- SELECT 
--     s.StudentID,
--     CONCAT(ui.FirstName, ' ', ui.LastName) AS NomeCompleto,
--     ui.Email,
--     TIMESTAMPDIFF(YEAR, ui.BirthDate, CURDATE()) AS Eta,
--     ct.CityName AS Citta,
--     COUNT(DISTINCT e.CourseID) AS NumeroCorsiFrequentati,
--     COUNT(v.VoteID) AS NumeroVoti,
--     ROUND(AVG(v.FinalVote), 2) AS MediaGenerale,
--     ROUND(AVG(v.FirstVote), 2) AS MediaPrimiVoti,
--     ROUND(AVG(v.SecondVote), 2) AS MediaSecondiVoti,
--     MIN(v.FinalVote) AS VotoMinimo,
--     MAX(v.FinalVote) AS VotoMassimo,
--     COUNT(CASE WHEN v.FinalVote >= 6 THEN 1 END) AS VotiSufficienti,
--     COUNT(CASE WHEN v.FinalVote < 6 THEN 1 END) AS VotiInsufficenti
-- FROM 
--     Student s
--     INNER JOIN UserInfo ui ON s.UserInfoID = ui.UserInfoID
--     INNER JOIN City ct ON ui.CityID = ct.CityID
--     INNER JOIN Enrollment e ON s.StudentID = e.StudentID
--     INNER JOIN Vote v ON s.StudentID = v.StudentID
-- WHERE 
--     s.IsDeleted = 0 
--     AND ui.IsDeleted = 0 
--     AND v.IsDeleted = 0
--     AND v.FinalVote IS NOT NULL
-- GROUP BY 
--     s.StudentID, ui.FirstName, ui.LastName, ui.Email, 
--     ui.BirthDate, ct.CityName
-- HAVING 
--     COUNT(v.VoteID) > 0
-- ORDER BY 
--     MediaGenerale DESC, NumeroVoti DESC;

-- -- Esempio di utilizzo: mostra i top 10 studenti
-- -- SELECT * FROM Vista_Classifica_Studenti LIMIT 10;


-- -- VISTA 5: Studenti Over 30 Ordinati per Merito
-- -- Mostra studenti con età > 30 anni ordinati per media voti (merito accademico)

-- CREATE OR REPLACE VIEW Vista_Studenti_Over30_Merito AS
-- SELECT 
--     s.StudentID,
--     CONCAT(ui.FirstName, ' ', ui.LastName) AS NomeCompleto,
--     ui.Email,
--     ui.BirthDate AS DataNascita,
--     TIMESTAMPDIFF(YEAR, ui.BirthDate, CURDATE()) AS Eta,
--     ct.CityName AS Citta,
--     p.ProvinceName AS Provincia,
--     COUNT(DISTINCT e.CourseID) AS NumeroCorsiFrequentati,
--     COUNT(v.VoteID) AS NumeroVoti,
--     ROUND(AVG(v.FinalVote), 2) AS MediaGenerale,
--     MIN(v.FinalVote) AS VotoMinimo,
--     MAX(v.FinalVote) AS VotoMassimo,
--     CASE 
--         WHEN AVG(v.FinalVote) >= 9 THEN 'Eccellente'
--         WHEN AVG(v.FinalVote) >= 8 THEN 'Ottimo'
--         WHEN AVG(v.FinalVote) >= 7 THEN 'Buono'
--         WHEN AVG(v.FinalVote) >= 6 THEN 'Sufficiente'
--         ELSE 'Insufficiente'
--     END AS GiudizioComplessivo,
--     GROUP_CONCAT(DISTINCT m.ModuleName ORDER BY m.ModuleName SEPARATOR ', ') AS CorsiFrequentati
-- FROM 
--     Student s
--     INNER JOIN UserInfo ui ON s.UserInfoID = ui.UserInfoID
--     INNER JOIN City ct ON ui.CityID = ct.CityID
--     INNER JOIN Province p ON ct.ProvinceID = p.ProvinceID
--     INNER JOIN Enrollment e ON s.StudentID = e.StudentID
--     INNER JOIN Course c ON e.CourseID = c.CourseID
--     INNER JOIN Module m ON c.CourseID = m.CourseID
--     INNER JOIN Vote v ON s.StudentID = v.StudentID AND m.ModuleID = v.ModuleID
-- WHERE 
--     s.IsDeleted = 0 
--     AND ui.IsDeleted = 0 
--     AND v.IsDeleted = 0
--     AND v.FinalVote IS NOT NULL
--     AND TIMESTAMPDIFF(YEAR, ui.BirthDate, CURDATE()) > 30
-- GROUP BY 
--     s.StudentID, ui.FirstName, ui.LastName, ui.Email, 
--     ui.BirthDate, ct.CityName, p.ProvinceName
-- HAVING 
--     COUNT(v.VoteID) > 0
-- ORDER BY 
--     MediaGenerale DESC, NumeroVoti DESC, Eta ASC;

-- -- Esempio di utilizzo: mostra studenti over 30 con media >= 8
-- -- SELECT * FROM Vista_Studenti_Over30_Merito WHERE MediaGenerale >= 8;


-- -- QUERY DI TEST PER VERIFICARE LE VISTE

-- -- Test Vista 1: Carriera dello studente con StudentID = 42
-- -- SELECT * FROM Vista_Carriera_Studente;

-- -- Test Vista 2: Esiti di React per il corso 15
-- -- SELECT * FROM Vista_Esiti_Materia_Corso;

-- -- Test Vista 3: Media voti per tutte le materie
-- -- SELECT * FROM Vista_Media_Voti_Materia_Corso ORDER BY MediaVotoFinale DESC;

-- -- Test Vista 4: Top 20 studenti per media
-- -- SELECT * FROM Vista_Classifica_Studenti LIMIT 20;

-- -- Test Vista 5: Studenti over 30 con media > 7
-- -- SELECT * FROM Vista_Studenti_Over30_Merito WHERE MediaGenerale > 7;