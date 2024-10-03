# Gestión de Hoteles

**Universidad**: Universidad Nacional del Nordeste.

**Facultad**: Facultad de Ciencias Exactas y Naturales y Agrimensura.

**Carrera**: Licenciatura en Sistemas de Información.

**Asignatura**: Bases de Datos I.

**Docente**: Villegas Darío.

**Integrantes**:
1.	Ortellado Agostina Anyelen.                        44224567.
2.	Portillo Juan Marcelo.                             36460188.
3.	Rodríguez Gastón Osvaldo.                          32732916.
4.	Romero Dayana Karin.                               35497094.

**Año**: 2024

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

El tema de este trabajo práctico es el diseño y desarrollo de una base de datos relacional para una cadena de hoteles a nivel nacional. La finalidad de la misma es gestionar de manera centralizada aspectos clave de la operación hotelera, como las reservas de habitaciones, el registro de huéspedes, la administración del personal, y el control de servicios adicionales. El sistema propuesto busca mejorar la eficiencia en la gestión operativa de la cadena, facilitando el acceso a la información y optimizando procesos esenciales.

### Definición o planteamiento del problema

El problema principal que abordaremos en este trabajo es cómo diseñar una base de datos eficiente para gestionar la operación de múltiples hoteles en diferentes ubicaciones. La gestión tradicional presenta desafíos como la administración manual de reservas, el seguimiento de los servicios consumidos por los huéspedes, y la correcta asignación de recursos humanos.

Entre los principales problemas que se busca resolver están:

-La necesidad de una estructura centralizada y organizada que permita el manejo de múltiples hoteles de manera eficiente.

-Cómo interrelacionar de manera efectiva entidades como empleados, huéspedes, habitaciones y servicios adicionales para brindar una visión integral de las operaciones del hotel.

-Cómo manejar la información de manera que se mantenga la integridad y consistencia de los datos a lo largo de las distintas operaciones diarias.

Las preguntas clave a responder en el desarrollo del sistema son:

-¿Cómo organizar la información de manera que sea fácilmente accesible y manejable para cada uno de los hoteles?

-¿Qué estructuras y relaciones son necesarias para reflejar fielmente las interacciones dentro de la operación de una cadena hotelera?

### Objetivo del Trabajo Práctico

El objetivo principal de este trabajo práctico es diseñar una base de datos relacional que permita a la cadena de hoteles gestionar sus operaciones diarias de manera eficaz, mejorando la administración y control de sus recursos. El sistema debe ser capaz de manejar de manera integral la información relevante para la operación hotelera, permitiendo un acceso rápido y seguro a los datos por parte de los usuarios autorizados.

i. Objetivo General

Desarrollar un modelo de base de datos relacional que permita la gestión completa de las operaciones de una cadena de hoteles, optimizando el manejo de información de reservas, habitaciones, empleados, huéspedes, y servicios adicionales.

ii. Objetivos Específicos

1- Definir y estructurar las entidades clave involucradas en la operación de los hoteles: huéspedes, empleados, habitaciones, reservas y servicios adicionales.

2- Establecer relaciones entre las entidades de manera que la base de datos refleje las interacciones reales entre los distintos actores del sistema.

3- Garantizar que el diseño de la base de datos respete la integridad y consistencia de la información, evitando redundancias y facilitando su consulta.

4- Proveer una estructura de base de datos que facilite la escalabilidad para futuros requerimientos, como la inclusión de más hoteles o nuevas funcionalidades

### Alcance del Trabajo Práctico

Este trabajo abarca el diseño e implementación de un sistema de base de datos relacional orientado a gestionar de manera eficiente la operación de una cadena de hoteles. Se cubren las siguientes áreas:

-Gestión de reservas: Control de las reservas realizadas por los huéspedes, incluyendo el seguimiento del estado de cada una (reservada, en curso, finalizada).

-Registro de huéspedes: Administración de la información personal de los huéspedes y su historial de visitas.

-Administración de habitaciones: Asignación de habitaciones a las reservas, gestión de tipos de habitación, estado y disponibilidad.

-Control de servicios adicionales: Registro de los servicios consumidos por los huéspedes durante su estancia (por ejemplo, spa, restaurante, etc.).

-Gestión de empleados: Administración de los datos de los empleados del hotel, incluyendo su cargo, turno y asignación a un hotel específico.

### Limitaciones del Trabajo Práctico

En este trabajo nos enfocaremos exclusivamente en la operación interna de los hoteles, limitando su alcance en los siguientes aspectos:

-No se aborda la facturación o sistema de pagos: Aunque se registran los servicios consumidos por los huéspedes, el sistema no incluye funciones para la facturación, procesamiento de pagos, o manejo de cuentas por cobrar.

-No se considera la integración con sistemas externos: La base de datos está diseñada para ser un sistema independiente, por lo que no incluye mecanismos de integración con otros sistemas externos, como plataformas de reservas online o sistemas de gestión de contabilidad.

-No se incluye un sistema de reportes avanzados: Aunque el sistema permite consultas básicas de la información, no se desarrollarán módulos avanzados de generación de reportes o análisis de datos.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

### Diagrama relacional
![diagrama_relacional](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/diagramaRelacional.png)


### Diccionario de datos

Acceso al documento [PDF](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/DiccionarioDatos_GestionHotel.pdf) del diccionario de datos.

