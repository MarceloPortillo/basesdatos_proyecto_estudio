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

4- Proveer una estructura de base de datos que facilite la escalabilidad para futuros requerimientos, como la inclusión de más hoteles o nuevas funcionalidades.

5- Entender el manejo de permisos y roles en bases de datos.

6- Aplicar permisos de lectura, escritura y ejecución para diferentes roles y usuarios.

7- Proveer una estructura que permita reutilizar código, reduciendo las duplicaciones y facilitando el mantenimiento.

8- Definir procedimientos y funciones almacenadas que permitan ejecutar consultas rápidamente.

9- Facilitar la búsqueda de registros específicos en una tabla grande con la implementación de índices.

10- Garantizar la protección de los datos contra fallos del sistema, realizando periódicamente copias de seguridad. 

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

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

***********Contiene las referencias fundamentales sobre la cual se erigirá el trabajo, los fundamentos y las
especificaciones que permitirán comprender mejor el problema planteado o bien el de marco
conceptual por cuanto tiene el propósito de expresar un sistema coordinado y coherente de
conceptos y proposiciones que explicaran mejor la investigación que realizamos. Se trata de
situar a nuestro problema dentro de un conjunto de conocimientos – los más sólidos posibles -,
de tal modo que permitan orientar nuestra búsqueda y nos ofrezcan una conceptualización
adecuada de los términos que utilizamos. En nuestro caso: Innovaciones Tecnológicas, TICs,
Globalización, Crecimiento, Desarrollo Regional o Local, cadenas productivas, clusters,
desarrollo sustentable, etc.*****************

## Tema: Optimización de consultas a través de índices
Un índice es una estructura en disco asociada con una tabla o vista que acelera la recuperación de filas de la tabla o vista. Un índice contiene claves construidas a partir de una o más columnas en la tabla o vista. Estas claves se almacenan en una estructura (B-árbol) que permite a SQL Server encontrar la fila o filas asociadas con los valores de clave de forma rápida y eficiente. Cuando se ejecuta esta consulta, el optimizador de consultas evalúa cada método disponible para recuperar los datos y selecciona el método más eficiente. El método puede ser un escaneo de tabla, o puede estar escaneando uno o más índices si existen.
Existen dos tipos de índices, los agrupados y los no agrupados. Los primeros ordenan y almacenan las filas de datos en la tabla o vista en función de sus valores clave. Estos valores clave son las columnas incluidas en la definición de índice. Solo puede haber un índice agrupado por tabla, porque las filas de datos en sí mismas se pueden almacenar en un solo orden. La única vez que las filas de datos en una tabla se almacenan en orden ordenado es cuando la tabla contiene un índice agrupado. Cuando una tabla tiene un índice agrupado, la tabla se denomina tabla agrupada. Este tipo de índice se asemeja a las conocidas guías telefónicas.
En el caso de los segundo, los índices no agrupados, tienen una estructura separada de las filas de datos. Un índice no agrupado contiene los valores de clave de índice no agrupados y cada entrada de valor de clave tiene un puntero a la fila de datos que contiene el valor de clave. El puntero de una fila de índice en un índice no agrupado a una fila de datos se denomina localizador de filas. La estructura del localizador de filas depende de si las páginas de datos se almacenan en un montón o en una tabla agrupada. Para un montón, un localizador de filas es un puntero a la fila. Para una tabla agrupada, el localizador de filas es la clave de índice agrupada. Este tipo de índice se asemeja al de un libro, por contener en sus hojas los punteros a las posiciones de memoria donde se almacena la información.
Ambos tipos de índices tienen sus ventajas y sus desventajas, se pueden crear múltiples índices no agrupados sobre una tabla, lo que puede acelerar consultas que no se benefician del índice agrupado. Sin embargo  cada vez que se inserta, actualiza o elimina una fila, los índices no agrupados también deben actualizarse, lo que puede afectar el rendimiento de las operaciones de escritura.

## CAPÍTULO III: METODOLOGÍA SEGUIDA

***********En este capítulo se presenta el plan seguido o las acciones llevadas a cabo para realizar el trabajo,
las dificultades encontradas, y cualquier otra información que proporcione la idea de cómo se
realizó el trabajo.
A fin de dar una idea de la metodología seguida, se deben observar los siguientes puntos:
a. Descripción de cómo se realizó el Trabajo Práctico.
Descripción de los pasos seguidos para realizar el trabajo, las actividades realizadas y
cualquier otra información que ayude a tener una idea del esfuerzo desplegado por el
alumno para la realización del trabajo.
b. Herramientas (Instrumentos y procedimientos)
Descripción de los instrumentos y procedimientos utilizados para la recolección y
tratamiento de la información. El alumno debe mencionar con qué método obtuvo los
datos; por ej., a través de entrevistas, de revisión bibliográfica, de Internet, etc*******

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

## Tema: Manejo de permisos a nivel de usuarios de base de datos

## Tema: Procedimientos y funciones almacenadas

## Tema: Optimización de consultas a través de índices


## Tema: Backup y restore. Backup en línea

### Diagrama relacional
![diagrama_relacional](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/diagramaRelacional.png)


### Diccionario de datos

Acceso al documento [PDF](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/DiccionarioDatos_GestionHotel.pdf) del diccionario de datos.

## CAPÍTULO V: CONCLUSIONES

************Este capítulo permite al alumno presentar su interpretación y explicar el sentido de los
resultados encontrados en el capítulo anterior. El alumno debe examinar los hallazgos y expresar
su propia opinión respecto a los mismos y determinar si los objetivos del Trabajo Práctico fueron
alcanzados.*************

## VI. BIBLIOGRAFÍA

****Bibliografía mencionada: Se deben citar de manera normalizada todos los documentos
consultados y efectivamente utilizados para la realización del trabajo. La forma correcta de
realizar las citas es incluyendo: autor (es), fecha de publicación, título, información acerca de la
publicación.********
