La empresa es una distribuidora de Licores y Vinos con actividad principalmente en Reino Unido, con 80 locales distribuidos en 68 ciudades.  
Tenemos una Base de ventas con dos meses de Ventas : Enero y Febrero 2016.
Una Base de compras con un año de registros : Febrero 2016 a Febrero 2017.
La de Inventario Final tiene Fecha 31/12/2016 , y la de Inventario Inicial 01/01/2016.
Dado que las fechas de las bases de ventas y las fechas de Inventario y Compra , no coinciden,
el análisis se centrará en Inventario y Compras, que nos proveen un ejercicio completo.
El dashboard final está orientado al área de Compras y Gestión de Inventarios, será un Dashboard operativo con KPI's y gráficos que ayuden a la toma de desciones.

# Análisis-Inventario

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
   #### Se analizaron las bases tanto con Phyton como con consultas en SQL.
      1. De 68 ciudades solo 6 tienen mas de un store, y lo máximo son 4 store en la ciudad de Hornsey.
      2. Los store son 80.
      3. Todos los stores, trabajan con ambos tipos de productos:licores y vinos
      4. Los licores representan la mayor cantidad de ventas (70%), aunque su variedad de productos
      es más limitada en comparación con los vinos, cuya venta está más diversificada entre diferentes productos. Esto influye significativamente en la gestión del stock.
      5. La venta cae abruptamente en Febrero 2016.
      6. Hay 12.260 productos distintos, el 70% son vinos.
### 3. Dashboard
   #### El Dashboard es un dashboard operativo para área de Inventarios y Compras.
   #### Tiene 4 páginas:
   #### 1. Menú principal con barra de navegación
   #### 2. General con Kpi´s  de Ventas, Compras e Inventarios. Las Ventas para tener una referencia pero como dijimos solo se tienen 2 meses de Ventas, no el ejercicio completo.
   ####  Tiene Segmentadores, el principal para abrir por Negocio : Licores y/o Vinos, y luego por Pais, Ciudad, Store, Proveedor y Producto si quisieran ver uno en particular aunque de mayor dificultad de encontrar por la variedad de productos que tiene ( para ello se pudo en preselector por letra). Los KPI's de Alerta y Dias de inventario te llevan a las páginas siguientes de detalles.
   #### 3. Detalle de Alertas de Stock por debajo del Stock Mínimo estipulado. Se llega haciendo Click en el KPI de Alertas de la página general.
   #### Tiene los mismos segmentadores que la página general, excepto el de Stores que se encuentra en un gráfico.
   #### 4. Detalle de Días de Inventario , para productos con inventario mayor a un año con el objetivo de revisarlos y tomar desiciones sobre ellos.
   #### Idem segmentadores que página de Alertas.
      
   
   

   
