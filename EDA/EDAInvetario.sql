
-- Productos con mas ventas
SELECT count(*)
FROM
	Sales
where Brand = 1004

SELECT
	TOP (10) Brand,
	FORMAT(sum(SalesDollars),'N2') as Ventas
	FROM Sales
	Group by Brand
	Order by Ventas desc
	

-- PRODUCTOS CON MAYOR MOV STOCK EN UNIDADES
SELECT * FROM Inventories
SELECT * FROM InventoriesInitial
--Creo una vista porque voy a utilizarla varias veces

CREATE VIEW StockporBrand AS
SELECT 
		I.Brand,
		sum(coalesce(IFI.OnHand,0)) as StockFinal,
		sum(coalesce(II.OnHand,0)) as StockInicial,  
		FORMAT(SUM(abs(((COALESCE(IFI.OnHand, 0) - COALESCE(II.OnHand, 0))))),'N2')as MovStock

	FROM 
		Inventories as I
	LEFT JOIN 
		InventoriesFinal AS IFI
	ON
		I.InventoryId = IFI.InventoryID
	LEFT JOIN
			InventoriesInitial as II
	ON
		I.InventoryId = II.InventoryID
		GROUP BY I.Brand
			

SELECT * FROM StockporBrand

--Productos nuevos SI =0
SELECT 
count(Brand) as ProductosNuevos
FROM StockporBrand
where StockInicial=0

--Productos SF = 0
SELECT 
count(Brand) as ProductossinStock
FROM StockporBrand
where StockFinal=0

--Total de productos
SELECT
	COUNT(distinct Brand) as Brands
FROM Brands

SELECT
	COUNT(*) as Brands
FROM Brands

--Productos con mayor stock promedio

SELECT
	top(10) Brand,
	(StockFinal-StockInicial)/2 as StockProm
FROM StockporBrand
order by StockProm desc

--fechas en ambas tablas
select 
	Max(PODate) as fechafinal,
	min(PODate) as fechainicial
from InvoicePurchases
union
select 
	Max(SalesDate) as fechafinal,
	min(SalesDate) as fechainicial
from Sales

select *
	--Max(PODate) as fechafinal
from InventoriesFinal



--Analisis Global de 1 producto = 1000

select 
	*
from
	(Select *
	from
		InventoriesFinal AS IFinal
	LEFT JOIN
		Inventories AS I
	ON
		I.InventoryID = IFinal.InventoryId) as Subconsulta
where  Brand = '1000'

SELECT 
    *,
	(StockInicial+Compras-StockFinal) as VentasCalculadas
FROM
    (SELECT 
		I.Brand,
		sum(IPD.Quantity) as Compras,
		sum(IFInal.OnHand) as StockFinal,
		sum(II.OnHand) as StockInicial
     FROM
         InventoriesFinal AS IFinal
     LEFT JOIN
         Inventories AS I
     ON
         I.InventoryID = IFinal.InventoryId
	LEFT JOIN
		InventoriesInitial AS II
	ON
		IFinal.InventoryId = II.InventoryID
	LEFT JOIN
		InvoicePurchasesDetails AS IPD
	ON
		IFinal.InventoryId = IPD.InventoryID
	Group by I.Brand) AS SubQuery
WHERE 
    Brand = '1001';

select 
 COUNT(InVENTORYID) AS CantidadCodigos,
 Sum(onHAnd) as StockFinal
from
InventoriesFinal
where InventoryId LIKE '%1001%' AND InventoryId NOT LIKE '%21001%' AND InventoryId NOT LIKE '%10010%' and InventoryId NOT LIKE '%10011%'

CREATE VIEW InventorySummary AS

WITH ComprasPorBrand AS (SELECT 
		I.Brand,
		sum(COALESCE(IPD.Quantity,0)) as compras
     FROM
         InvoicePurchasesDetails AS IPD
     LEFT JOIN
         Inventories AS I
     ON
         I.InventoryID = IPD.InventoryId
GROUP BY I.Brand),
StockInicialPorBrand AS (SELECT 
		I.Brand,
		sum(COALESCE(Ii.OnHand,0)) as StockInicial
     FROM
         InventoriesInitial AS II
     LEFT JOIN
         Inventories AS I
     ON
         I.InventoryID = II.InventoryId
GROUP BY I.Brand),
StockFinalPorBrand AS (SELECT 
		I.Brand,
		sum(COALESCE(IFInal.OnHand,0)) as StockFinal
     FROM
         InventoriesFinal AS IFinal
     LEFT JOIN
         Inventories AS I
     ON
         I.InventoryID = IFinal.InventoryId
GROUP BY I.Brand
)
	
SELECT
    SI.Brand,
    COALESCE(SI.StockInicial,0) as StockInicial,
    COALESCE(SF.StockFinal,0) as StockFinal,
    COALESCE(C.Compras,0) as Compras,
	COALESCE(SI.StockInicial,0)+COALESCE(C.Compras,0)-COALESCE(SF.StockFinal,0) as Ventas
FROM
    StockInicialPorBrand AS SI
LEFT JOIN
    StockFinalPorBrand AS SF
ON
    SI.Brand = SF.Brand
LEFT JOIN
    ComprasPorBrand AS C
ON
    SI.Brand = C.Brand

select
 *
 from
 InventorySummary
 where Brand = 1001

 select 
	sum(Stockinicial) as StockinicialTotal,
	sum(StockFInal) as StockFInalTotal,
	sum(Compras) as ComprasTotal,
	sum(Ventas) as VentasTotal
from
InventorySummary

select * from InvoicePurchasesDetails
--ciiudades que mas venden
SELECT COUNT(*)FROM Stores
SELECT * FROM Sales

SELECT
	TOP(10)
	St.City,
	count(distinct St.Store) as CantidadStores,
	round(sum(Sa.SalesDollars),2) as VentaTotal
FROM
	Sales as Sa
LEFT JOIN
	Stores as St
ON
	Sa.Store = St.Store
Group by  St.City
ORDER BY VentaTotal DESC

--cuantos stores por city
select 
	top(10)
	City,
	count(Store) as cantidadStores
from
stores
group by City
order by cantidadStores desc

--cantidad de venta por ciudad por store
CREATE VIEW VentaPromxCityyStore as
select
	City,
	VentaTotal,
	CantidadStores,
	round(VentaTotal/CantidadStores,2) as VentaPromxStore
from
(
SELECT
	St.City,
	count(distinct St.Store) as CantidadStores,
	round(sum(Sa.SalesDollars),2) as VentaTotal

FROM
	Sales as Sa
LEFT JOIN
	Stores as St
ON
	Sa.Store = St.Store
Group by  St.City
)  as VentasporCity

--media, max y min venta por store

select 
	MIN(VentaPromxStore) as MenorVentaProm,
	MAX(VentaPromxStore) as MayorVentaProm,
	AVG(VentaPromxStore) as PromVentaProm

from
	VentaPromxCityyStore


--VER SI EN  TODOS LOS STORES ESTAN AMBAS CLASIFICACIONES

Select 
	I.Store,
	COUNT(distinct B.Clasification) as ClasificacionesTrabajadas
from 
	Inventories as I
LEFT JOIN
	Brands as B
ON
	I.Brand = B.Brand
GROUP BY 
	I.Store
ORDER BY
		ClasificacionesTrabajadas ASC


Select 
	I.Store,
	COUNT(distinct B.Clasification) as ClasificacionesTrabajadas
from 
	Inventories as I
LEFT JOIN
	Brands as B
ON
	I.Brand = B.Brand
GROUP BY 
	I.Store
HAVING 
	COUNT(distinct B.Clasification) <2
ORDER BY
		I.Store DESC

	