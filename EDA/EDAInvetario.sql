
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

	