USE LibraryDB;

-- VISTA 1: Storico completo dei noleggi di ciascun utente
-- FILTRO: Solo noleggi degli ultimi 12 mesi

CREATE OR REPLACE VIEW Vista_Storico_Noleggi_Utente AS
SELECT
R.RentalID AS 'ID_Noleggio',
R.StartDate AS 'Data_Inizio',
R.TerminationDate AS 'Data_Fine',
C.CustomerID AS 'ID_Cliente',
U.UserID AS 'ID_Utente',
U.FirstName AS 'Nome',
U.LastName AS 'Cognome',
U.Email AS 'Email',
U.Phone AS 'Telefono'
FROM Rental R
JOIN Customer C ON R.CustomerID = C.CustomerID
JOIN User U ON C.UserID = U.UserID
WHERE R.StartDate >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
ORDER BY U.LastName, U.FirstName, R.StartDate DESC;

-- VISTA 2: Elenco dei noleggi attualmente attivi
-- FILTRO: Solo noleggi NON restituiti

CREATE OR REPLACE VIEW Vista_Noleggi_Attivi AS
SELECT
R.RentalID AS 'ID_Noleggio',
R.StartDate AS 'Data_Inizio',
C.CustomerID AS 'ID_Cliente',
U.FirstName AS 'Nome_Cliente',
U.LastName AS 'Cognome_Cliente',
U.Phone AS 'Telefono',
E.EmployeeID AS 'ID_Dipendente',
CONCAT(UE.FirstName, ' ', UE.LastName) AS 'Dipendente_Responsabile'
FROM Rental R
JOIN Customer C ON R.CustomerID = C.CustomerID
JOIN User U ON C.UserID = U.UserID
JOIN Employee E ON R.EmployeeID = E.EmployeeID
JOIN User UE ON E.UserID = UE.UserID
WHERE R.TerminationDate IS NULL
ORDER BY R.StartDate;

-- VISTA 3: Dettaglio dei libri noleggiati in ogni singolo noleggio
-- FILTRO: Solo un noleggio specifico

CREATE OR REPLACE VIEW Vista_Dettaglio_Libri_Noleggio AS
SELECT
RD.RentalID AS 'ID_Noleggio',
R.StartDate AS 'Data_Inizio',
R.TerminationDate AS 'Data_Fine',
RD.BookID AS 'ID_Libro',
BI.Title AS 'Titolo',
A.FirstName AS 'Nome_Autore',
A.LastName AS 'Cognome_Autore',
RD.QuantityOfBook AS 'Quantita',
B.Copy AS 'Numero_Copia'
FROM RentalDetail RD
JOIN Rental R ON RD.RentalID = R.RentalID
JOIN Book B ON RD.BookID = B.BookID
JOIN BookInfo BI ON B.BookInfoID = BI.BookInfoID
JOIN Author A ON B.AuthorID = A.AuthorID
WHERE RD.RentalID = 25
ORDER BY BI.Title;

-- VISTA 4: Noleggi con informazioni bibliografiche complete
-- FILTRO: Solo libri in una lingua specifica

CREATE OR REPLACE VIEW Vista_Noleggi_Info_Complete AS
SELECT
BI.Language AS 'Lingua',
R.RentalID AS 'ID_Noleggio',
R.StartDate AS 'Data_Inizio',
R.TerminationDate AS 'Data_Fine',
CONCAT(U.FirstName, ' ', U.LastName) AS 'Cliente',
BI.Title AS 'Titolo_Libro',
CONCAT(A.FirstName, ' ', A.LastName) AS 'Autore',
S.Name AS 'Fornitore',
BI.PublicationYear AS 'Anno_Pubblicazione',
RD.QuantityOfBook AS 'Quantita'
FROM Rental R
JOIN Customer C ON R.CustomerID = C.CustomerID
JOIN User U ON C.UserID = U.UserID
JOIN RentalDetail RD ON R.RentalID = RD.RentalID
JOIN Book B ON RD.BookID = B.BookID
JOIN BookInfo BI ON B.BookInfoID = BI.BookInfoID
JOIN Author A ON B.AuthorID = A.AuthorID
JOIN Supplier S ON B.SupplierID = S.SupplierID
WHERE BI.Language = 'Spagnolo'
ORDER BY R.StartDate DESC;

-- VISTA 5: Noleggi scaduti o restituiti in ritardo
-- FILTRO: Solo noleggi con più di 30 giorni

CREATE OR REPLACE VIEW Vista_Noleggi_Ritardo AS
SELECT
R.RentalID AS 'ID_Noleggio',
R.StartDate AS 'Data_Inizio',
R.TerminationDate AS 'Data_Fine',
DATEDIFF(IFNULL(R.TerminationDate, CURDATE()), R.StartDate) AS 'Giorni_Prestito',
CONCAT(U.FirstName, ' ', U.LastName) AS 'Cliente',
U.Email AS 'Email',
U.Phone AS 'Telefono',
CASE
WHEN R.TerminationDate IS NULL THEN 'ANCORA IN PRESTITO'
ELSE 'RESTITUITO IN RITARDO'
END AS 'Stato'
FROM Rental R
JOIN Customer C ON R.CustomerID = C.CustomerID
JOIN User U ON C.UserID = U.UserID
WHERE DATEDIFF(IFNULL(R.TerminationDate, CURDATE()), R.StartDate) > 30
ORDER BY DATEDIFF(IFNULL(R.TerminationDate, CURDATE()), R.StartDate) DESC;

-- VISTA 6: Disponibilità dei libri per titolo
-- FILTRO: Solo libri attualmente DISPONIBILI (almeno 1 copia libera)

CREATE OR REPLACE VIEW Vista_Disponibilita_Libri AS
SELECT
BI.BookInfoID AS 'ID_Libro',
BI.Title AS 'Titolo',
CONCAT(A.FirstName, ' ', A.LastName) AS 'Autore',
BI.TotalCopies AS 'Copie_Totali',
IFNULL(COUNT(RD.BookID), 0) AS 'Copie_In_Prestito',
(BI.TotalCopies - IFNULL(COUNT(RD.BookID), 0)) AS 'Copie_Disponibili',
CASE
WHEN (BI.TotalCopies - IFNULL(COUNT(RD.BookID), 0)) > 0 THEN 'DISPONIBILE'
ELSE 'NON DISPONIBILE'
END AS 'Stato'
FROM BookInfo BI
JOIN Book B ON BI.BookInfoID = B.BookInfoID
JOIN Author A ON B.AuthorID = A.AuthorID
LEFT JOIN RentalDetail RD ON B.BookID = RD.BookID
LEFT JOIN Rental R ON RD.RentalID = R.RentalID AND R.TerminationDate IS NULL
WHERE BI.IsDeleted = 0
GROUP BY BI.BookInfoID, BI.Title, A.FirstName, A.LastName, BI.TotalCopies
HAVING (BI.TotalCopies - IFNULL(COUNT(RD.BookID), 0)) > 0
ORDER BY BI.Title;

-- VISTA 7: Produttività dei dipendenti
-- FILTRO: Solo dipendenti ancora attivi (TerminationDate IS NULL)

CREATE OR REPLACE VIEW Vista_Produttivita_Dipendenti AS
SELECT
E.EmployeeID AS 'ID_Dipendente',
CONCAT(U.FirstName, ' ', U.LastName) AS 'Nome_Dipendente',
E.TypeOfContract AS 'Tipo_Contratto',
E.StartDate AS 'Data_Assunzione',
COUNT(R.RentalID) AS 'Numero_Noleggi_Gestiti',
MIN(R.StartDate) AS 'Primo_Noleggio',
MAX(R.StartDate) AS 'Ultimo_Noleggio'
FROM Employee E
JOIN User U ON E.UserID = U.UserID
LEFT JOIN Rental R ON E.EmployeeID = R.EmployeeID
WHERE E.IsDeleted = 0
AND E.TerminationDate IS NULL
GROUP BY E.EmployeeID, U.FirstName, U.LastName, E.TypeOfContract, E.StartDate
ORDER BY COUNT(R.RentalID) DESC;

-- VISTA 8: Profilo complessivo dei clienti con statistiche
-- FILTRO: Solo clienti con almeno 1 noleggio attivo

CREATE OR REPLACE VIEW Vista_Profilo_Clienti AS
SELECT
C.CustomerID AS 'ID_Cliente',
CONCAT(U.FirstName, ' ', U.LastName) AS 'Nome_Cliente',
U.Email AS 'Email',
U.Address AS 'Indirizzo',
U.Phone AS 'Telefono',
COUNT(R.RentalID) AS 'Totale_Noleggi',
SUM(CASE WHEN R.TerminationDate IS NULL THEN 1 ELSE 0 END) AS 'Noleggi_Attivi',
SUM(CASE WHEN R.TerminationDate IS NOT NULL THEN 1 ELSE 0 END) AS 'Noleggi_Completati',
MIN(R.StartDate) AS 'Primo_Noleggio',
MAX(R.StartDate) AS 'Ultimo_Noleggio'
FROM Customer C
JOIN User U ON C.UserID = U.UserID
LEFT JOIN Rental R ON C.CustomerID = R.CustomerID
WHERE C.IsDeleted = 0
GROUP BY C.CustomerID, U.FirstName, U.LastName, U.Email, U.Address, U.Phone
HAVING SUM(CASE WHEN R.TerminationDate IS NULL THEN 1 ELSE 0 END) > 0
ORDER BY COUNT(R.RentalID) DESC;

-- VISTA 9: Catalogo dei libri con stato di conservazione
-- FILTRO: Solo libri in condizioni specifiche

CREATE OR REPLACE VIEW Vista_Catalogo_Conservazione AS
SELECT
BI.BookInfoID AS 'ID_Libro',
BI.Title AS 'Titolo',
CONCAT(A.FirstName, ' ', A.LastName) AS 'Autore',
BI.Language AS 'Lingua',
BI.PublicationYear AS 'Anno_Pubblicazione',
BI.ConservationStatus AS 'Stato_Conservazione',
BI.TotalCopies AS 'Copie_Totali',
S.Name AS 'Fornitore'
FROM BookInfo BI
JOIN Book B ON BI.BookInfoID = B.BookInfoID
JOIN Author A ON B.AuthorID = A.AuthorID
JOIN Supplier S ON B.SupplierID = S.SupplierID
WHERE BI.IsDeleted = 0
AND BI.ConservationStatus = 'Buono'
GROUP BY BI.BookInfoID, BI.Title, A.FirstName, A.LastName, BI.Language,
BI.PublicationYear, BI.ConservationStatus, BI.TotalCopies, S.Name
ORDER BY BI.Title;

-- VISTA 10: Autori più noleggiati in un determinato intervallo di tempo
-- FILTRO: Solo noleggi degli ultimi 6 mesi

CREATE OR REPLACE VIEW Vista_Autori_Piu_Noleggiati AS
SELECT
A.AuthorID AS 'ID_Autore',
CONCAT(A.FirstName, ' ', A.LastName) AS 'Nome_Autore',
A.Birth AS 'Data_Nascita',
COUNT(RD.RentalDetailID) AS 'Numero_Noleggi',
COUNT(DISTINCT B.BookInfoID) AS 'Libri_Diversi_Noleggiati',
MIN(R.StartDate) AS 'Primo_Noleggio',
MAX(R.StartDate) AS 'Ultimo_Noleggio'
FROM Author A
JOIN Book B ON A.AuthorID = B.AuthorID
JOIN RentalDetail RD ON B.BookID = RD.BookID
JOIN Rental R ON RD.RentalID = R.RentalID
WHERE A.IsDeleted = 0
AND R.StartDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY A.AuthorID, A.FirstName, A.LastName, A.Birth
ORDER BY COUNT(RD.RentalDetailID) DESC;

-- VISTA 11: Frequenza di utilizzo delle singole copie di libro
-- FILTRO: Solo copie usate almeno 1 volta

CREATE OR REPLACE VIEW Vista_Frequenza_Copie AS
SELECT
B.BookID AS 'ID_Copia',
B.Copy AS 'Numero_Copia',
BI.Title AS 'Titolo',
CONCAT(A.FirstName, ' ', A.LastName) AS 'Autore',
COUNT(RD.RentalDetailID) AS 'Volte_Noleggiata',
MIN(R.StartDate) AS 'Primo_Noleggio',
MAX(R.StartDate) AS 'Ultimo_Noleggio',
CASE
WHEN COUNT(RD.RentalDetailID) = 0 THEN 'MAI NOLEGGIATA'
WHEN COUNT(RD.RentalDetailID) <= 3 THEN 'POCO USATA'
WHEN COUNT(RD.RentalDetailID) <= 10 THEN 'USATA NORMALMENTE'
ELSE 'MOLTO USATA'
END AS 'Frequenza_Uso'
FROM Book B
JOIN BookInfo BI ON B.BookInfoID = BI.BookInfoID
JOIN Author A ON B.AuthorID = A.AuthorID
LEFT JOIN RentalDetail RD ON B.BookID = RD.BookID
LEFT JOIN Rental R ON RD.RentalID = R.RentalID
GROUP BY B.BookID, B.Copy, BI.Title, A.FirstName, A.LastName
HAVING COUNT(RD.RentalDetailID) > 0
ORDER BY COUNT(RD.RentalDetailID) DESC, BI.Title;
