# Analisis-Inventario
## Base SQL
### 1. ETL y Armado de Base en SQL
   #### Se analizaron las Bases de Datos, se buscaron nulos y faltantes. Se buscaron las relaciones entre las tablas, los identificadores únicos para establecer claves primarias de cada tabla. Se buscaron los tipos de datos y se cambiaron los datos correspondientes a Fecha.
   #### Se analizaron las relaciones de las tablas y su correspondiente asignacion como clave Foragnea
   #### Se eliminaron las redundancias y eliminaron campos que estaban repetidos. Para ello se crearon tablas de dimensiones = Stores, Vendors, Brands e Inventories. Las tablas de Hechos son = InventoriesFinal, InventoriesInitial, Sales, InvoicePurchases, InvoicePurchasesDetail.
   #### Se crearon identificadores únicos para las tablas Sales e InvoicePurchasesDetails.
   #### Se armo un resumen en excel con las tablas, sus columnas, sus claves forágneas y primarias (TablasOrigonalesResumen .xlsx)
   #### Se armó el DiagramadeChen y el Diagrama EntidadRelacion en drawDB.
   #### Se creó la Base de Datos en SQL y la tablas, conforme al esquema del Excel.
   #### Se crearon las bases de datos en Phyton, reagrupando y corrigiendo datos, que respondan al diagrama ER.
   #### Se insertaron los datos con la función BULK INSERT desde SQL.
### 2. EDA
### 3. Insights
   

   
