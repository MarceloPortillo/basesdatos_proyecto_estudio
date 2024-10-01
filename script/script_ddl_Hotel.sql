CREATE DATABASE hotel;

USE hotel;

CREATE TABLE Categorias
(
  id_categoria INT IDENTITY NOT NULL,
  nombre_categoria VARCHAR(100) NOT NULL,
  tarifa_base FLOAT NOT NULL,
  CONSTRAINT PK_categorias_id_categoria PRIMARY KEY (id_categoria),
  CONSTRAINT CK_Categoria_tarifa_base CHECK (tarifa_Base > 0)
);

CREATE TABLE Medios_de_pagos
(
  id_medio_dePago INT IDENTITY NOT NULL,
  nombre INT NOT NULL,
  CONSTRAINT PK_Medios_de_pagos_id PRIMARY KEY (id_medio_dePago)
);

CREATE TABLE Perfiles
(
  id_perfil INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT PK_Perfiles_id_perfil PRIMARY KEY (id_perfil)
);

CREATE TABLE ciudades
(
  id_ciudad INT IDENTITY NOT NULL,
  nombre_ciudad VARCHAR(100) NOT NULL,
  CONSTRAINT PK_ciudades_id_ciudad PRIMARY KEY (id_ciudad)
);

CREATE TABLE Nacionalidades
(
  id_pais INT IDENTITY NOT NULL,
  nombre_pais VARCHAR(100) NOT NULL,
  CONSTRAINT PK_Nacionalidades_id_pais PRIMARY KEY (id_pais)
);

CREATE TABLE Provincias
(
  id_provincias INT IDENTITY NOT NULL,
  nombre_provincias VARCHAR(100) NOT NULL,
  CONSTRAINT PK_Provincias_id_provincias PRIMARY KEY (id_provincias)
);

CREATE TABLE Regimenes
(
  id_regimenes INT NOT NULL,
  Desayuno BIT DEFAULT 1,
  Cena BIT NOT NULL,
  CONSTRAINT PK_Regimenes_id_regimenes PRIMARY KEY (id_regimenes)
);

CREATE TABLE Usuarios
(
  Nro_legajo INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  dni NUMERIC(15) NOT NULL,
  email VARCHAR(100) NOT NULL,
  fecha_creacion DATE NOT NULL,
  id_perfil INT NOT NULL,
  CONSTRAINT PK_Usuarios_Nro_legajo PRIMARY KEY (Nro_legajo),
  CONSTRAINT FK_Usuarios_id_perfil FOREIGN KEY (id_perfil) REFERENCES Perfiles(id_perfil),
  CONSTRAINT UQ_Usuarios_dni UNIQUE (dni),
  CONSTRAINT UQ_Usuarios_email UNIQUE (email)
);



CREATE TABLE Pagos
(
  id_pago INT NOT NULL,
  metodo_pago VARCHAR(100) NOT NULL,
  id_reserva INT NOT NULL,
  CONSTRAINT PK_pagos_id_pago PRIMARY KEY (id_pago),
  CONSTRAINT FK_Pagos_id_reserva FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva)
);

CREATE TABLE detalle_pago
(
  id_pago INT NOT NULL,
  id_medio_dePago INT NOT NULL,
  subtotal FLOAT NOT NULL,  
  CONSTRAINT PK_detalle_pago_id_pago_id_medio_dePago PRIMARY KEY (id_pago, id_medio_dePago),
  CONSTRAINT FK_detalle_pago_id_pago FOREIGN KEY (id_pago) REFERENCES Pagos(id_pago),
  CONSTRAINT FK_detalle_pago_id_medio_dePago FOREIGN KEY (id_medio_dePago) REFERENCES Medios_de_pagos(id_medio_dePago),
  CONSTRAINT CK_detalle_pago_subtotal CHECK (subtotal > 0)
);

CREATE TABLE Habitaciones
(
  id_habitacion INT NOT NULL,
  nro_de_hab INT NOT NULL,
  capacidad INT NOT NULL,
  disponible BIT NOT NULL,
  id_reserva INT NOT NULL,
  id_categoria INT NOT NULL,
  CONSTRAINT PK_Habitaciones_id_habitacion PRIMARY KEY (id_habitacion),
  CONSTRAINT FK_Habitaciones_id_reserva FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva),
  CONSTRAINT FK_Habitaciones_id_categoria FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
  CONSTRAINT CK_Habitaciones_capacidad CHECK (capacidad > 0),
  CONSTRAINT CK_Huesped_disponibilidad CHECK (Disponible IN ('Disponible', 'Ocupada'))
);

CREATE TABLE Reservas
(
  id_reserva INT NOT NULL,
  fecha_ingreso DATE NOT NULL,
  fecha_salida DATE NOT NULL,
  cantidad_personas INT NOT NULL,
  monto_total FLOAT NOT NULL,
  Nro_legajo INT NOT NULL,
  id_regimenes INT NOT NULL,
  CONSTRAINT PK_Reservas_id_reserva PRIMARY KEY (id_reserva),
  CONSTRAINT FK_Reservas_Nro_legajo FOREIGN KEY (Nro_legajo) REFERENCES Usuarios(Nro_legajo),
  CONSTRAINT FK_Reservas_id_regimenes FOREIGN KEY (id_regimenes) REFERENCES Regimenes(id_regimenes),
  CONSTRAINT chk_cantidad_personas CHECK (cantidad_Personas > 0 AND Cantidad_Personas <= (SELECT capacidad FROM Habitaciones WHERE id_habitacion = Reservas.id_habitacion)),
  CONSTRAINT chk_fechas_reserva CHECK (Fecha_Salida > Fecha_Ingreso),
  CONSTRAINT chk_estadia_minima CHECK (DATEDIFF(day, Fecha_Ingreso, Fecha_Salida) >= 1),
  CONSTRAINT chk_monto_pago CHECK (monto_total > 0)
);

CREATE TABLE Huespedes
(
  id_huesped INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  dni NUMERIC(15) NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(100) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  id_habitacion INT NOT NULL,
  id_reserva INT NOT NULL,
  id_pais INT NOT NULL,
  id_ciudad INT NOT NULL,
  id_provincias INT NOT NULL,
  CONSTRAINT PK_Huespedes_id_huesped PRIMARY KEY (id_huesped),
  CONSTRAINT FK_Huespedes_id_habitacion FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion),
  CONSTRAINT FK_Huespedes_id_reserva FOREIGN KEY (id_reserva) REFERENCES Reservas(id_reserva),
  CONSTRAINT FK_Hespedes_id_pais FOREIGN KEY (id_pais) REFERENCES Nacionalidades(id_pais),
  CONSTRAINT FK_Huespedes_id_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudades(id_ciudad),
  CONSTRAINT FK_Huespedes_id_provincias FOREIGN KEY (id_provincias) REFERENCES Provincias(id_provincias),
  CONSTRAINT UQ_Usuarios_dni UNIQUE (dni),
  CONSTRAINT UQ_Usuarios_email UNIQUE (email),
  CONSTRAINT UQ_Usuarios_telefono UNIQUE (telefono)
);