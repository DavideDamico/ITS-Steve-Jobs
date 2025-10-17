-- SELECT * FROM coupon WHERE CouponID = 5;

-- SELECT
--     ProductID,
--     ProductName,
--     ProductType,
--     Price,
--     ROUND(Price * 1.04, 2) AS PriceMaggiorato,
--     ROUND(Price * 1.04 - Price, 2) AS ValoreMaggiorazione
-- FROM product

-- WHERE ProductType = 'PIZZA' OR ProductType = 'DESS'
-- WHERE ProductType IN ('PIZZA', 'DESS') 
-- WHERE ProductType <> 'PIZZA'
-- WHERE ProductType NOT IN ('PIZZA', 'DESS')

-- WHERE Price <= 3 OR Price > 10
-- WHERE Price BETWEEN 3 AND 10

-- WHERE ProductName LIKE '%ri%'

-- WHERE Price > 3 
-- ORDER BY Price DESC

-- Esercizio:
-- Vorrei osservare tutte le pizze in catalogo, contenenti nel nome la lettera i,
-- ordinate in ordine alfabetico , nello specifico vorrei osservare il nome della pizza,
-- il prezzo, ed il prezzo al netto dell'IVA al 4%

-- SELECT
--     ProductType,
--     ProductName,
--     Price,
--     ROUND(Price * 0.96, 2) AS Prezzo_Netto
-- FROM product
-- WHERE ProductName LIKE '%i%'
-- ORDER BY ProductType, ProductName;

-- SELECT
--     CustomerName,
--     ProductName,
--     Count(*) AS NumeroOrdini
-- FROM customerorderdetail
-- GROUP BY CustomerName, ProductName
-- ORDER BY CustomerName asc, ProductName desc

-- SELECT
--     CustomerName,
--     ProductName,
--     SUM(PurchaseAmount) AS PurchaseAmount,
--     Price * SUM(Quantity) AS TotalPurchaseAmountCalculated

-- FROM customerorderdetail
-- GROUP BY CustomerName, ProductName, Price
-- ORDER BY CustomerName, ProductName;

-- SELECT
--     e.EmployeeID,
--     e.FirstName,
--     e.LastName,
--     h.StartDate,
--     h.TerminationDate
-- FROM Employee as e
-- INNER JOIN employeehistory as h
-- on e.EmployeeID = h.EmployeeID
-- ORDER BY e.LastName, h.StartDate

-- SELECT
--     p.ProductID,
--     p.ProductName,
--     p.Price,
--     p.Price - (SELECT AVG(Price) FROM product)
-- FROM product as p