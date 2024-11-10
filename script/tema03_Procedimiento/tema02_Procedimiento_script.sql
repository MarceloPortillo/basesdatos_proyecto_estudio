
use gestionHotel_V1

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- *******************************************************
-- Desarrollado por: <Gast�n>
-- Fecha de implementaci�n: <23/10/2024>
-- Prop�sito: Inserci�n de registros en la tabla 'Empleados'
-- *******************************************************

CREATE PROCEDURE InsertEmpleado
    @Nombre varchar(100),
    @Apellido varchar(100),
    @dni varchar(20),
    @Telefono varchar(15),
    @Direccion varchar(200),
    @email varchar(50),
    @Fecha_contratacion DATE,
    @ID_Cargo INT,
    @ID_Turno INT,
    @ID_Hotel INT
AS
BEGIN
    INSERT INTO Empleados
    (
        Nombre, 
        Apellido, 
        dni, 
        Telefono, 
        Direccion, 
        email, 
        Fecha_contratacion, 
        ID_Cargo, 
        ID_Turno, 
        ID_Hotel,
        Fecha_creacion
    )
    VALUES
    (
        @Nombre, 
        @Apellido, 
        @dni, 
        @Telefono, 
        @Direccion, 
        @email, 
        @Fecha_contratacion, 
        @ID_Cargo, 
        @ID_Turno, 
        @ID_Hotel,
        GETDATE() -- Establece la fecha actual para Fecha_creacion
    );
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ****************************************************
-- Creado por:   <Gast�n>
-- Fecha de creaci�n: <23/10/2024>
-- Descripci�n: Modificaci�n de los datos de la tabla 'Empleados'
-- ****************************************************
CREATE PROCEDURE UpdateEmpleado
	
	@ID_Empleado int,
	@Nombre varchar(100) = null,
	@Apellido varchar(100) = null,
	@dni varchar(20) = null,
	@Telefono varchar(15) = null,
	@Direccion varchar(200) = null,
	@email varchar(50) = null,
	@Fecha_contratacion date = null,
	@ID_Cargo int = null,
	@ID_Turno int = null,
	@ID_Hotel int = null
AS
BEGIN
    UPDATE Empleados
    SET
        Nombre = CASE WHEN @Nombre IS NOT NULL THEN @Nombre ELSE Nombre END,
        Apellido = CASE WHEN @Apellido IS NOT NULL THEN @Apellido ELSE Apellido END,
        dni = CASE WHEN @dni IS NOT NULL THEN @dni ELSE dni END,
        Telefono = CASE WHEN @Telefono IS NOT NULL THEN @Telefono ELSE Telefono END,
        Direccion = CASE WHEN @Direccion IS NOT NULL THEN @Direccion ELSE Direccion END,
        email = CASE WHEN @email IS NOT NULL THEN @email ELSE email END,
        Fecha_contratacion = CASE WHEN @Fecha_contratacion IS NOT NULL THEN @Fecha_contratacion ELSE Fecha_contratacion END,
        ID_Cargo = CASE WHEN @ID_Cargo IS NOT NULL THEN @ID_Cargo ELSE ID_Cargo END,
        ID_Turno = CASE WHEN @ID_Turno IS NOT NULL THEN @ID_Turno ELSE ID_Turno END,
        ID_Hotel = CASE WHEN @ID_Hotel IS NOT NULL THEN @ID_Hotel ELSE ID_Hotel END
    WHERE ID_Empleado = @ID_Empleado;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ******************************************************
-- Desarrollador: <Gast�n>
-- Fecha de creaci�n: <24/10/2024>
-- Prop�sito: Eliminaci�n de registros de la tabla 'Empleados'
-- ******************************************************
CREATE PROCEDURE DeleteEmpleado
	
	@ID_Empleado int
AS
BEGIN
    DELETE FROM Empleados
    WHERE ID_Empleado = @ID_Empleado;
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--==================================================================================================


EXEC InsertEmpleado
    @Nombre = 'Gaston', 
    @Apellido = 'Morales', 
    @dni = '32658974', 
    @Telefono = '3794859674', 
    @Direccion = 'San Juan 1485', 
    @email = 'gaston.Morales@hotmail.com', 
    @Fecha_contratacion = '2023-06-01', 
    @ID_Cargo = 1, 
    @ID_Turno = 2, 
    @ID_Hotel = 1;

EXEC InsertEmpleado
    @Nombre = 'Juan Marcelo',
    @Apellido = 'Portillo',
    @dni = '35123456',
    @Telefono = '3794-142563',
    @Direccion = 'Cuba 1985',
    @email = 'marceloportillo@gmail.com.com',
    @Fecha_contratacion = '2024-10-23',
    @ID_Cargo = 1,
    @ID_Turno = 2,
    @ID_Hotel = 1;

	select * from Empleados;

--==================================================================================================
--1. Inserci�n Directa con Sentencias INSERT
-- Inserci�n directa de un lote de datos
INSERT INTO Empleados (Nombre, Apellido, dni, Telefono, Direccion, email, Fecha_contratacion, ID_Cargo, ID_Turno, ID_Hotel, Fecha_creacion)
VALUES 
('Ana', 'Gonz�lez', '23456789', '555-1235', 'Calle Real 456', 'ana.gonzalez@example.com', '2024-10-01', 1, 2, 1, GETDATE()),

--2. Inserci�n de un Lote de Datos usando Procedimientos Almacenados
EXEC InsertEmpleado 'Gaston', 'Morales', '32658974', '3794859674', 'San Juan 1485',
'gaston.Morales@hotmail.com', '2023-06-01', 1, 2, 1;

--3. Se realiza un Update de un Lote de Datos usando Procedimientos Almacenados. 
EXEC UpdateEmpleado 3, 'Gast�n', 'Morales', '32658974', '3794859674', 'San Juan 1485',
'gaston.Morales@hotmail.com', '2023-06-01', 1, 2, 1;

--4. Elimianr un empleado
EXEC DeleteEmpleado 3;

--==================================================================================================
--Funci�n para Calcular la Edad a Partir de la Fecha de Contrataci�n:

CREATE FUNCTION CalcularAntiguedad(
    @FechaContratacion date
)
RETURNS int
AS
BEGIN
    DECLARE @Antiguedad int;
    SELECT @Antiguedad = DATEDIFF(YEAR, @FechaContratacion, GETDATE()) -
                        CASE 
                            WHEN DATEADD(YEAR, DATEDIFF(YEAR, @FechaContratacion, GETDATE()), @FechaContratacion) > GETDATE() 
                            THEN 1 
                            ELSE 0 
                        END;
    RETURN @Antiguedad;
END;
GO

--Funci�n para Obtener el Nombre Completo del Empleado:

CREATE FUNCTION ObtenerNombreCompleto(
    @ID_Empleado int
)
RETURNS varchar(200)
AS
BEGIN
    DECLARE @NombreCompleto varchar(200);
    SELECT @NombreCompleto = CONCAT(Nombre, ' ', Apellido)
    FROM Empleados
    WHERE ID_Empleado = @ID_Empleado;
    
    RETURN @NombreCompleto;
END;
GO

--Funci�n para Verificar si un Empleado Lleva M�s de X A�os en la Empresa:

CREATE FUNCTION EmpleadoConAntiguedad(
    @ID_Empleado int,
    @Anos int
)
RETURNS varchar(2)
AS
BEGIN
    DECLARE @Antiguedad int;
    
    SELECT @Antiguedad = DATEDIFF(YEAR, e.Fecha_contratacion, GETDATE())
    FROM Empleados e
    WHERE ID_Empleado = @ID_Empleado;
                              
        RETURN CASE WHEN @Antiguedad >= @Anos THEN 'SI' ELSE 'NO' END;
   END;
GO

--====================================prueba de ejecuci�n antiguedad===================================


select e.ID_Empleado, e.nombre, e.apellido, dbo.CalcularAntiguedad(e.Fecha_contratacion) as 'Antiguedad del empleado'
from Empleados e

select dbo.ObtenerNombreCompleto(e.ID_Empleado)
from Empleados e

select e.ID_Empleado, e.nombre, e.apellido, dbo.EmpleadoConAntiguedad(e.ID_Empleado,4)
from Empleados e
