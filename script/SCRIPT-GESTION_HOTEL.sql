CREATE DATABASE gestionHotel_V1;
go
use gestionHotel_V1;

CREATE TABLE Tipo_habitacion
(
  ID_TipoHabitacion INT NOT NULL,
  Precio_noche_tipo FLOAT NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Tipo_habitacion_ID_TipoHabitacion PRIMARY KEY (ID_TipoHabitacion),
  CONSTRAINT CK_Tipo_habitacion_Precio_noche_tipo CHECK (Precio_noche_tipo > 0)
);

CREATE TABLE Servicios_adicionales
(
  ID_Servicio INT NOT NULL,
  Descripcion VARCHAR(200) NOT NULL,
  Precio_unitario FLOAT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Servicios_adicionales_ID_Servicio PRIMARY KEY (ID_Servicio),
);

CREATE TABLE Estado_Habitacion
(
  ID_Estado_Habitacion INT NOT NULL,
  Descripcion VARCHAR(200) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Estado_Habitacion_ID_Estado_Habitacion PRIMARY KEY (ID_Estado_Habitacion),
);

CREATE TABLE Turno
(
  ID_Turno INT NOT NULL,
  Descripción VARCHAR(200) NOT NULL,
  Horario_inicio DATE NOT NULL,
  Horario_fin DATE NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Turno_ID_Turno PRIMARY KEY (ID_Turno),
);

CREATE TABLE Categoria
(
  ID_Categoria INT NOT NULL,
  Nro_estrellas INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Categoria_ID_Categoria PRIMARY KEY (ID_Categoria),
);

CREATE TABLE Estado_Reserva
(
  ID_Estado_Reserva INT NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Estado_Reserva_ID_Estado_Reserva PRIMARY KEY (ID_Estado_Reserva),
);

CREATE TABLE Cargo
(
  ID_Cargo INT NOT NULL,
  Descripcion VARCHAR(200) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Cargo_ID_Cargo PRIMARY KEY (ID_Cargo),
);

CREATE TABLE Pais
(
  ID_Pais INT NOT NULL,
  Nombre VARCHAR (50) NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Pais_ID_Pais PRIMARY KEY (ID_Pais),
);


CREATE TABLE Provincia
(
  ID_Provincia INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Provincia_ID_Provincia_ID_Pais PRIMARY KEY (ID_Provincia, ID_Pais),
  CONSTRAINT FK_Provincia_ID_Pais FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais),
);

CREATE TABLE Ciudades
(
  ID_Ciudad INT NOT NULL,
  Nombre VARCHAR(50) NOT NULL,
  ID_Provincia INT NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Ciudades_ID_Ciudad_ID_Provincia_ID_Pais PRIMARY KEY (ID_Ciudad, ID_Provincia, ID_Pais),
  CONSTRAINT FK_Ciudades_ID_Provincia_ID_Pais FOREIGN KEY (ID_Provincia, ID_Pais) REFERENCES Provincia(ID_Provincia,ID_Pais),
);

CREATE TABLE Hotel
(
  ID_Hotel INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  ID_Categoria INT NOT NULL,
  ID_Ciudad INT NOT NULL,
  ID_Provincia INT NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Hotel_ID_Hotel PRIMARY KEY (ID_Hotel),
  CONSTRAINT FK_Hotel_ID_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
  CONSTRAINT FK_Hotel_ID_Ciudad_ID_Provincia_ID_Provincia_ID_Pais FOREIGN KEY (ID_Ciudad, ID_Provincia, ID_Pais) REFERENCES Ciudades(ID_Ciudad, ID_Provincia, ID_Pais),
  CONSTRAINT UQ_Hotel_email UNIQUE (Email),
);

CREATE TABLE Telefono
(
  ID_Telefono INT NOT NULL,
  Numero VARCHAR(15) NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Telefono_ID_Telefono PRIMARY KEY (ID_Telefono),
  CONSTRAINT FK_Telefono_ID_Hotel FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel),
);

CREATE TABLE Habitaciones
(
  Nro_habitacion INT NOT NULL,
  Capacidad INT NOT NULL,
  Precio_noche FLOAT NOT NULL,
  Piso INT NOT NULL,
  ID_TipoHabitacion INT NOT NULL,
  ID_Estado_Habitacion INT NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Habitaciones_Nro_habitacion PRIMARY KEY (Nro_habitacion,ID_Hotel),
  CONSTRAINT FK_Habitaciones_ID_TipoHabitacion FOREIGN KEY (ID_TipoHabitacion) REFERENCES Tipo_habitacion(ID_TipoHabitacion),
  CONSTRAINT FK_Habitaciones_ID_Estado_Habitación FOREIGN KEY (ID_Estado_Habitacion) REFERENCES Estado_Habitacion(ID_Estado_Habitacion),
  CONSTRAINT FK_Habitaciones_ID_Hotel FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel),
  CONSTRAINT CK_Habitaciones_Capacidad CHECK (Capacidad > 0),
);

CREATE TABLE Huespedes
(
  ID_Huesped INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  DNI VARCHAR(8) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  ID_Ciudad INT NOT NULL,
  ID_Provincia INT NOT NULL,
  ID_Pais INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Huespedes_ID_Huesped PRIMARY KEY (ID_Huesped),
  CONSTRAINT FK_Huespedes_ID_Ciudad_ID_Provincia_ID_Pais FOREIGN KEY (ID_Ciudad, ID_Provincia, ID_Pais) REFERENCES Ciudades(ID_Ciudad, ID_Provincia, ID_Pais),
  CONSTRAINT UQ_Huespedes_DNI UNIQUE (DNI),
  CONSTRAINT UQ_Huespedes_Telefono UNIQUE (Telefono),
  CONSTRAINT UQ_Huespedes_Email UNIQUE (Email),
  CONSTRAINT CK_Huespedes_Edad CHECK (DATEDIFF(YEAR, fecha_nacimiento, GETDATE()) >= 18),
);

CREATE TABLE Reservas
(
  ID_Reserva INT NOT NULL,
  Fecha_reserva DATETIME DEFAULT GETDATE() NOT NULL,
  Fecha_checkIn DATE NOT NULL,
  Fecha_checkOut DATE NOT NULL,
  ID_Estado_Reserva INT NOT NULL,
  ID_Huesped INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_reservas_ID_Reserva_ID_Huesped PRIMARY KEY (ID_Reserva,ID_Huesped),
  CONSTRAINT FK_Reservas_ID_Estado_Reserva FOREIGN KEY (ID_Estado_Reserva) REFERENCES Estado_Reserva(ID_Estado_Reserva),
  CONSTRAINT FK_Reservas_ID_Huesped FOREIGN KEY (ID_Huesped) REFERENCES Huespedes(ID_Huesped),
  CONSTRAINT CK_Reservas_FechasValidas CHECK (Fecha_checkOut > Fecha_checkIn),
  CONSTRAINT CK_Reservas_Estadia_minima CHECK (DATEDIFF(day, Fecha_checkIn, Fecha_checkOut) >= 1),
);

CREATE TABLE Empleados
(
  ID_Empleado INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Apellido VARCHAR(100) NOT NULL,
  dni VARCHAR(20) NOT NULL,
  Telefono VARCHAR(15) NOT NULL,
  Direccion VARCHAR(200) NOT NULL,
  email VARCHAR (50) NOT NULL,
  Fecha_contratacion DATE NOT NULL,
  ID_Cargo INT NOT NULL,
  ID_Turno INT NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Empleados_ID_Empleado PRIMARY KEY (ID_Empleado),
  CONSTRAINT FK_Empleados_ID_Cargo FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo),
  CONSTRAINT FK_Empleados_ID_Turno FOREIGN KEY (ID_Turno) REFERENCES Turno(ID_Turno),
  CONSTRAINT FK_Empleados_ID_Hotel FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel),
  CONSTRAINT UQ_Empleados_telefono UNIQUE (Telefono),
  CONSTRAINT UQ_Usuarios_dni UNIQUE (dni),
  CONSTRAINT UQ_Usuarios_email UNIQUE (email),
);

CREATE TABLE Consumo
(
  ID_Consumo INT NOT NULL,
  Fecha DATE NOT NULL,
  Cantidad INT NOT NULL,
  Total FLOAT NOT NULL,
  ID_Servicio INT NOT NULL,
  ID_Reserva INT NOT NULL,
  ID_Huesped INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_Consumo_ID_Consumo_ID_Servicio_ID_Reserva_ID_Huesped PRIMARY KEY (ID_Consumo,ID_Servicio,ID_Reserva,ID_Huesped),
  CONSTRAINT FK_Consumo_ID_Servicio FOREIGN KEY (ID_Servicio) REFERENCES Servicios_adicionales(ID_Servicio),
  CONSTRAINT FK_Consumo_ID_Reserva_ID_Huesped FOREIGN KEY (ID_Reserva, ID_Huesped) REFERENCES Reservas(ID_Reserva, ID_Huesped),
);

CREATE TABLE ReservasHabitaciones
(
  ID_Reserva INT NOT NULL,
  ID_Huesped INT NOT NULL,
  Nro_habitacion INT NOT NULL,
  ID_Hotel INT NOT NULL,
  Fecha_creacion DATETIME DEFAULT GETDATE() NOT NULL,
  CONSTRAINT PK_ReservasHabitaciones_ID_Reserva_ID_Huesped_Nro_habitacion_ID_Hotel PRIMARY KEY (ID_Reserva,ID_Huesped,Nro_habitacion,ID_Hotel),
  CONSTRAINT FK_ReservasHabitaciones_ID_Reserva_ID_Huesped FOREIGN KEY (ID_Reserva, ID_Huesped) REFERENCES Reservas(ID_Reserva, ID_Huesped),
  CONSTRAINT FK_ReservasHabitaciones_Nro_habitacion_ID_Hotel  FOREIGN KEY (Nro_habitacion, ID_Hotel) REFERENCES Habitaciones(Nro_habitacion, ID_Hotel),
);


--LOTES DE PRUEBAS --
select * from Tipo_habitacion;

-- Insertar datos en la tabla Tipo_habitacion
INSERT INTO Tipo_habitacion (ID_TipoHabitacion, Precio_noche_tipo, Descripcion)
VALUES
(1, 100.00, 'Habitación Estándar'),
(2, 200.00, 'Habitación Doble'),
(3, 300.00, 'Suite Ejecutiva');

INSERT INTO Tipo_habitacion (ID_TipoHabitacion, Precio_noche_tipo, Descripcion)
VALUES
(4, 100, 'Suite Ejecutiva');

SELECT * FROM Tipo_habitacion;

-- Insertar datos en la tabla Servicios_adicionales
INSERT INTO Servicios_adicionales (ID_Servicio, Descripcion, Precio_unitario)
VALUES
(1, 'Desayuno', 50.00),
(2, 'Spa', 150.00),
(3, 'Gimnasio', 100.00);

SELECT * FROM Servicios_adicionales;

-- Insertar datos en la tabla Estado_Habitacion
INSERT INTO Estado_Habitacion (ID_Estado_Habitacion, Descripcion)
VALUES
(1, 'Disponible'),
(2, 'Ocupada'),
(3, 'En Mantenimiento');

-- Insertar datos en la tabla Turno
INSERT INTO Turno (ID_Turno, Descripción, Horario_inicio, Horario_fin)
VALUES
(1, 'Mañana', '2024-10-02 06:00:00', '2024-10-02 14:00:00'),
(2, 'Tarde', '2024-10-02 14:00:00', '2024-10-02 22:00:00'),
(3, 'Noche', '2024-10-02 22:00:00', '2024-10-03 06:00:00');

-- Insertar datos en la tabla Categoria
INSERT INTO Categoria (ID_Categoria, Nro_estrellas)
VALUES
(1, 3),
(2, 4),
(3, 5);

-- Insertar datos en la tabla Estado_Reserva
INSERT INTO Estado_Reserva (ID_Estado_Reserva, Descripcion)
VALUES
(1, 'Confirmada'),
(2, 'Pendiente'),
(3, 'Cancelada');

-- Insertar datos en la tabla Cargo
INSERT INTO Cargo (ID_Cargo, Descripcion)
VALUES
(1, 'Recepcionista'),
(2, 'Gerente'),
(3, 'Reservas');

-- Insertar datos en la tabla Pais
INSERT INTO Pais (ID_Pais, Nombre)
VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Uruguay');

-- Insertar datos en la tabla Provincia
INSERT INTO Provincia (ID_Provincia, Nombre, ID_Pais)
VALUES
(1, 'Buenos Aires', 1),
(2, 'Sao Paulo', 2),
(3, 'Montevideo', 3);

-- Insertar datos en la tabla Ciudades
INSERT INTO Ciudades (ID_Ciudad, Nombre, ID_Provincia, ID_Pais)
VALUES
(1, 'CABA', 1, 1),
(2, 'Campinas', 2, 2),
(3, 'Punta del Este', 3, 3);

-- Insertar datos en la tabla Hotel
INSERT INTO Hotel (ID_Hotel, Nombre, Direccion, Email, ID_Categoria, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES
(1, 'Hotel Buenos Aires', 'Av. Corrientes 1234', 'buenosaires@hotel.com', 3, 1, 1, 1),
(2, 'Hotel Sao Paulo', 'Av. Paulista 5678', 'saopaulo@hotel.com', 2, 2, 2, 2),
(3, 'Hotel Punta del Este', 'Calle 50 123', 'puntadeleste@hotel.com', 1, 3, 3, 3);

-- Insertar datos en la tabla Habitaciones
INSERT INTO Habitaciones (Nro_habitacion, Capacidad, Precio_noche, Piso, ID_TipoHabitacion, ID_Estado_Habitacion, ID_Hotel)
VALUES
(101, 2, 150.00, 1, 1, 1, 1),
(102, 4, 250.00, 2, 2, 2, 1),
(103, 6, 400.00, 3, 3, 1, 1);

-- Insertar datos en la tabla Huespedes
INSERT INTO Huespedes (ID_Huesped, Nombre, Apellido, DNI, Direccion, Telefono, Email, fecha_nacimiento, ID_Ciudad, ID_Provincia, ID_Pais)
VALUES
(1, 'Juan', 'Pérez', '12345678', 'Calle Falsa 123', '1156784321', 'juan.perez@gmail.com', '1990-01-01', 1, 1, 1),
(2, 'Maria', 'López', '87654321', 'Avenida Siempreviva 456', '1156784322', 'maria.lopez@gmail.com', '1995-05-15', 1, 1, 1);

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (ID_Reserva, Fecha_reserva, Fecha_checkIn, Fecha_checkOut, ID_Estado_Reserva, ID_Huesped)
VALUES
(1, '2024-10-01', '2024-10-05', '2024-10-10', 1, 1),
(2, '2024-10-01', '2024-10-08', '2024-10-15', 2, 2);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (ID_Empleado, Nombre, Apellido, dni, Telefono, Direccion, email, Fecha_contratacion, ID_Cargo, ID_Turno, ID_Hotel)
VALUES
(1, 'Carlos', 'Gomez', '11223344', '1165432100', 'Calle Ejemplo 123', 'carlos.gomez@hotel.com', '2020-01-15', 1, 1, 1),
(2, 'Ana', 'Martínez', '22334455', '1165432101', 'Av. Prueba 456', 'ana.martinez@hotel.com', '2021-02-10', 2, 2, 1);

-- Insertar datos en la tabla Consumo
INSERT INTO Consumo (ID_Consumo, Fecha, Cantidad, Total, ID_Servicio, ID_Reserva, ID_Huesped)
VALUES
(1, '2024-10-06', 2, 100.00, 1, 1, 1),
(2, '2024-10-09', 1, 150.00, 2, 1, 1);

-- Insertar datos en la tabla ReservasHabitaciones
INSERT INTO ReservasHabitaciones (ID_Reserva, ID_Huesped, Nro_habitacion, ID_Hotel)
VALUES
(1, 1, 101, 1),
(2, 2, 102, 1);

select * from ReservasHabitaciones;

