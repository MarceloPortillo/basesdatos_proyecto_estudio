## Tema: Optimización de consultas a través de índices

•	Agrupado:
Crear un indice agrupado:
CREATE CLUSTERED INDEX idx_fecha_checkOut ON Reservas(Fecha_checkOut);
Borrar indice creado:
DROP INDEX idx_fecha_checkOut ON Reservas;
•	No agrupado:
Crear un indice  no agrupado:
CREATE NONCLUSTERED INDEX idx_fecha_checkOut_dato ON Reservas(Fecha_checkOut)
INCLUDE (Fecha_checkIn);
Borrar indice  no agrupado:
DROP INDEX idx_fecha_checkOut_dato ON Reservas;
•	Plan de ejecución del motor de base de datos STATICS PROFILE, STATICS TIME Y SHOWPLAN
La sentencia SET STATISTICS TIME ON; en SQL Server permite ver los tiempos de ejecución de las consultas, tanto el tiempo de CPU como el tiempo total requerido para completar la consulta. Cuando está activada, cada vez que se ejecuta una consulta, SQL Server muestra:
-Tiempo de CPU usado por la consulta.
-Tiempo total de ejecución, que incluye tiempo de espera y procesamiento en el servidor.
SET STATISTICS TIME ON;
SELECT * FROM [NombreTabla] WHERE [Condiciones];--consulta
SET STATISTICS OFF;-- Deshabilitar el plan de ejecución
-Tiempo de CPU usado por la consulta.
-Tiempo total de ejecución, que incluye tiempo de espera y procesamiento en el servidor.
SHOWPLAN_ALL – no ejecuta la consulta, muestra el texto del plan de consultas estimado junto con el costo de la estimación.
SET SHOWPLAN_ALL ON;-- Habilitar el plan de ejecución para la consulta
SELECT * FROM [NombreTabla] WHERE [Condiciones];--consulta
SET SHOWPLAN_ALL OFF;-- Deshabilitar el plan de ejecución
STATISTICS PROFILE – ejecuta la consulta, muestra los resultados y texto del plan de consultas real.
SET STATISTICS PROFILE ON;
SELECT * FROM [NombreTabla] WHERE [Condiciones];--consulta
SET STATISTICS PROFILE OFF;
