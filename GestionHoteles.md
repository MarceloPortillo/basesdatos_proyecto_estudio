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

### TEMA 1 Manejo de permisos a nivel de usuarios de base de datos

El manejo de permisos en bases de datos tiene un papel muy importante en cuanto se habla a proteger la integridad y confidencialidad de los datos. Con la administración de los permisos a nivel de usuarios y roles, se logra una flexibilidad y un control efectivo sobre las acciones que cada usuario puede realizar, reduciendo   los riesgos de acceso no autorizado. Esto incluye desde la asignación de permisos de ejecución específicos hasta la creación de roles que simplifican la gestión de accesos y responsabilidades.

Flexibilidad en la Gestión de Permisos:
La gestión de permisos a nivel de usuarios y roles permite una administración flexible y segura de los accesos a la base de datos. Se puede asignar de forma precisa qué acciones puede realizar cada usuario, minimizando riesgos de seguridad.

Permisos de Ejecución Específicos:
Dar permisos de ejecución sobre procedimientos almacenados a usuarios con permisos limitados permite que realicen ciertas operaciones sin necesidad de tener acceso directo a las tablas. Esto añade una capa adicional de seguridad.

Restricciones y Seguridad:
Las restricciones de permisos, como limitar a read_user a solo lectura y ejecución de procedimientos específicos, garantizan que usuarios no autorizados no puedan alterar datos críticos en la base directamente.

Roles en la Base de Datos:
La creación de los roles que agrupan permisos específicos es una práctica efectiva para gestionar accesos. Al asignar estos roles a los usuarios adecuados, se puede controlar de manera eficiente quién puede hacer qué dentro de la base de datos.


### TEMA 2 Procedimientos y Funciones

Procedimientos Un procedimiento almacenado es un grupo de una o varias instrucciones, en nuestro caso Transact-SQL para SQL server, que se ejecutan secuencialmente algunas de sus caracteristicas son:
Aceptan parámetros de entrada y pueden devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.

Contener instrucciones de programación que realicen operaciones en la base de datos, como también pueden contener llamadas a otros procedimientos.

Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.

Ventajas de usar procedimientos almacenados

Tráfico de red reducido entre el cliente y el servidor: los comandos de un procedimiento se ejecutan en un único lote de código. Esto puede reducir significativamente el tráfico de red entre el servidor y el cliente porque únicamente se envía a través de la red la llamada que va a ejecutar el procedimiento.

Mayor seguridad: varios usuarios y programas cliente pueden realizar operaciones en los objetos de base de datos subyacentes a través de un procedimiento, aunque los usuarios y los programas no tengan permisos directos sobre esos objetos subyacentes. El procedimiento controla qué procesos y actividades se llevan a cabo y protege los objetos de base de datos subyacentes. Esto elimina la necesidad de conceder permisos en cada nivel de objetos y simplifica los niveles de seguridad.

Reutilización del código: el código de cualquier operación de base de datos redundante resulta un candidato perfecto para la encapsulación de procedimientos. De este modo, se elimina la necesidad de escribir de nuevo el mismo código, se reducen las inconsistencias de código y se permite que cualquier usuario o aplicación que cuente con los permisos necesarios pueda acceder al código y ejecutarlo.

Mantenimiento más sencillo: cuando las aplicaciones cliente llaman a procedimientos y mantienen las operaciones de base de datos en la capa de datos, solo deben actualizarse los cambios de los procesos en la base de datos subyacente.

Rendimiento mejorado: de forma predeterminada, un procedimiento se compila la primera vez que se ejecuta y crea un plan de ejecución que vuelve a usarse en posteriores ejecuciones. Como el procesador de consultas no tiene que crear un nuevo plan, normalmente necesita menos tiempo para procesar el procedimiento.

Funciones Al igual que las funciones de los lenguajes de programación, las funciones definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.
Ventajas de las funciones definidas por el usuario

Programación modular: puede crear la función una vez, almacenarla en la base de datos y llamarla desde el programa tantas veces como desee.

Ejecución más rápida: com pasa con los procedimientos almacenados, las funciones definidas por el usuario de Transact-SQL reducen el costo de compilación del código de Transact-SQL almacenando los planes en la caché y reutilizándolos para ejecuciones repetidas.

Reducción del tráfico de red: una operación que filtra datos basándose en restricciones complejas que no se puede expresar en una sola expresión escalar se puede expresar como una función.

Tipos de funciones

Funciones escalares : las funciones escalares definidas por el usuario devuelven un único valor de datos del tipo definido en la cláusula RETURNS. El tipo devuelto puede ser de cualquier tipo de datos excepto text, ntext, image, cursory timestamp.

Funciones con valores de tabla: las funciones con valores de tabla definidas por el usuario devuelven un tipo de datos table. La tabla es el conjunto de resultados de una sola instrucción SELECT.

Funciones del sistema : SQL Server proporciona numerosas funciones del sistema que se pueden usar para realizar diversas operaciones, estas no se pueden modificar.

Funciones deterministas y no deterministas: las funciones deterministas siempre devuelven el mismo resultado cada vez que se llama con un conjunto específico de valores de entrada y tienen el mismo estado de la base de datos. Las funciones no deterministas pueden devolver resultados diferentes cada vez que se les llama con un conjunto específico de valores de entrada, incluso si el estado de la base de datos al que acceden sigue siendo el mismo.

Diferencias entre procedimientos y funciones

Tipo de retorno: una función siempre devuelve un valor, mientras que un procedimiento almacenado no es obligatorio que lo haga.

Parámetros: un procedimiento almacenado puede tener parámetros de entrada y salida, mientras que una función no puede tener parámetros de salida.

Llamadas: una función se puede llamar desde un procedimiento almacenado, pero no al revés.

Instrucciones :una función solo permite una instrucción SELECT, mientras que un procedimiento almacenado permite SELECT, INSERT, UPDATE y DELETE.

Transacciones: un procedimiento almacenado puede administrar transacciones, pero una función no.

Uso en declaraciones SELECT: una función se puede incrustar en una declaración SELECT, pero un procedimiento almacenado no.

## Tema: Optimización de consultas a través de índices
Un índice es una estructura en disco asociada con una tabla o vista que acelera la recuperación de filas de la tabla o vista. Un índice contiene claves construidas a partir de una o más columnas en la tabla o vista. Estas claves se almacenan en una estructura (B-árbol) que permite a SQL Server encontrar la fila o filas asociadas con los valores de clave de forma rápida y eficiente. Cuando se ejecuta esta consulta, el optimizador de consultas evalúa cada método disponible para recuperar los datos y selecciona el método más eficiente. El método puede ser un escaneo de tabla, o puede estar escaneando uno o más índices si existen.
Existen dos tipos de índices, los agrupados y los no agrupados. Los primeros ordenan y almacenan las filas de datos en la tabla o vista en función de sus valores clave. Estos valores clave son las columnas incluidas en la definición de índice. Solo puede haber un índice agrupado por tabla, porque las filas de datos en sí mismas se pueden almacenar en un solo orden. La única vez que las filas de datos en una tabla se almacenan en orden ordenado es cuando la tabla contiene un índice agrupado. Cuando una tabla tiene un índice agrupado, la tabla se denomina tabla agrupada. Este tipo de índice se asemeja a las conocidas guías telefónicas.
En el caso de los segundo, los índices no agrupados, tienen una estructura separada de las filas de datos. Un índice no agrupado contiene los valores de clave de índice no agrupados y cada entrada de valor de clave tiene un puntero a la fila de datos que contiene el valor de clave. El puntero de una fila de índice en un índice no agrupado a una fila de datos se denomina localizador de filas. La estructura del localizador de filas depende de si las páginas de datos se almacenan en un montón o en una tabla agrupada. Para un montón, un localizador de filas es un puntero a la fila. Para una tabla agrupada, el localizador de filas es la clave de índice agrupada. Este tipo de índice se asemeja al de un libro, por contener en sus hojas los punteros a las posiciones de memoria donde se almacena la información.
Ambos tipos de índices tienen sus ventajas y sus desventajas, se pueden crear múltiples índices no agrupados sobre una tabla, lo que puede acelerar consultas que no se benefician del índice agrupado. Sin embargo  cada vez que se inserta, actualiza o elimina una fila, los índices no agrupados también deben actualizarse, lo que puede afectar el rendimiento de las operaciones de escritura.

## CAPÍTULO III: METODOLOGÍA SEGUIDA
El proyecto lo llevamos a cabo mediante la búsqueda individual de información respecto al tema asignado a cada miembro del grupo. Realizamos el diagrama de relación-entidad y nos dividimos en partes equitativa la investigación acerca de las diferentes técnicas de trabajo (Manejo de Permisos a Nivel de Usuarios, Procedimientos y funciones almacenadas, Back Up y Restore, optimización de consultas) y el desarrollo de las mismas. Fuimos proponiendo distintas fechas de reuniones para ir compartiendo lo desarrollado y acoplando las distintas partes del proyecto, eso lo hicimos de manera virtual para tener una mejor visión del código y la búsqueda de información. El informe lo realizamos entre todos ya que fuimos aportando ideas y uniendo lo investigado, así como la carga de datos ya que contiene muchas claves foráneas y se hacía imposible ir viendo los errores ya que algunas tablas dependen de otras.

Herramientas Utilizadas

SQL Server.
SQL Server Management Studio (SSMS): Ofrece interfaces gráficas para la gestión de permisos y roles en bases de datos
WhatsApp: Fue unos de los medios más utilizado para ir coordinando las reuniones, respondiendo consultas, y pasar información no solo del proyecto si no de la materia en sí.
Meet: Fue el medio que utilizamos para llevar a cabo algunas reuniones virtuales e ir compartiendo el proceso en la creación del proyecto ya que es una plataforma gratuita y que no requiere una conexión a internet muy buena.
GitHub: fue la última herramienta en incorporar, porque fue donde cargamos los códigos para compartirnos y dimos permisos de colaborador a los profesores que desarrollan la materia.
Los datos se obtuvieron de internet.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

## Tema: Manejo de permisos a nivel de usuarios de base de datos

## Tema: Procedimientos y funciones almacenadas

Para el desarrollo de este tema se realizaron en primer lugar 3 procedimientos, uno que realiza un insert sobre la tabla empelados de nuestra base de dados del proyecto, otro que realiza un update sobre la tabla empleados y por último uno que realiza un delete sobre la tabla emepleados. Luego se pasa a las funciones que se realizaron 3 funciones que devuelven una tabla, en la que cada una realiza una operacion sobre la tabla empleados para una determinada antiguedad, variando si se busca en un determinado año, si se busca entre un rango de fechas o si se busca discriminar por tipo de empleado. Para finalizar se realizó un procedimiento y una funcion en la que ambos reciben un mismo tipo de parámetro, un id que refiere a un empleado, y la idea a probar es que ambas devuelvan los mismos resultados y comparando la eficiencia entre ellas.

En el siguiente enlace se encuentra el script sql referido a este tema

## Estructura del procedimiento Insert Empleados:
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Estructura_Insert_Empleado.png)

## Estructura de la función FuncionCalcularAntiguedad:
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Funcion_CalculaAntiguedad.png)

## Ubicación de los procedimientos y funciones dentro de la base de datos
![Estructura Insert](https://github.com/MarceloPortillo/basesdatos_proyecto_estudio/blob/main/doc/Ubicacion_Proce_Funciones.png)


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


Microsoft. (n.d.). Stored procedures (Database Engine). Microsoft Learn. https://learn.microsoft.com/es-es/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16


