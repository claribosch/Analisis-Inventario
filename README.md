La empresa es una distribuidora de Licores en Reino Unido, con 80 locales distribuidos en 68 ciudades.  
Tenemos una Base de ventas con dos meses de Ventas : Enero y Febrero 2016.
Una Base de compras con un año de registros : Febrero 2016 a Febrero 2017.
La de Inventario Final tiene Fecha 31/12/2016 , y la de Inventario Inicial 01/01/2016.
Dado que las fechas de las bases de ventas y las fechas de Inventario y compra , no coinciden,
el análisis se centrará en estos últimos, que nos proveen un ejercicio completo.
El dashboard final está orientado al área de Compras y Gestión de Inventarios, y es un adashboard de gestión con KPI's y datos puntuales de ese éstas áreas.

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
      1. De 68 ciudades solo 6 tienen mas de un store, y lo máximo son 4 store en la ciudad de Hornsey.
      2. Los store son 80.
      3. Todos los stores, trabajan con ambos tipos de productos:licores y vinos
      4. Los vinos representan el 70% de los prodcutos vendidos, sin embargo, son el 40% de la facturación. Si bien la cantidad vendida es mucho mayor en los vinos, mantienen niveles más bajos de stock en relación  su venta, en el stock final representa cada uno aprx el 50%. Es llamativo el nivel de stock en unidades de los licores, siendo que se venden menos y son los más caros. 
      La venta cae abruptamente en Febrero 2016.
      
1er tema a analizar = Nivel Stock licores. 

### 3. Insights
   

   
