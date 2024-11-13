## MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE DE DATOS

El manejo de permisos en bases de datos tiene un papel muy importante en cuanto se habla a proteger la integridad y confidencialidad de los datos. Con la administración de los permisos a nivel de usuarios y roles, se logra una flexibilidad y un control efectivo sobre las acciones que cada usuario puede realizar, reduciendo   los riesgos de acceso no autorizado. Esto incluye desde la asignación de permisos de ejecución específicos hasta la creación de roles que simplifican la gestión de accesos y responsabilidades.

Flexibilidad en la Gestión de Permisos:
La gestión de permisos a nivel de usuarios y roles permite una administración flexible y segura de los accesos a la base de datos. Se puede asignar de forma precisa qué acciones puede realizar cada usuario, minimizando riesgos de seguridad.

Permisos de Ejecución Específicos:
Dar permisos de ejecución sobre procedimientos almacenados a usuarios con permisos limitados permite que realicen ciertas operaciones sin necesidad de tener acceso directo a las tablas. Esto añade una capa adicional de seguridad.

Restricciones y Seguridad:
Las restricciones de permisos, como limitar a read_user a solo lectura y ejecución de procedimientos específicos, garantizan que usuarios no autorizados no puedan alterar datos críticos en la base directamente.

Roles en la Base de Datos:
La creación de los roles que agrupan permisos específicos es una práctica efectiva para gestionar accesos. Al asignar estos roles a los usuarios adecuados, se puede controlar de manera eficiente quién puede hacer qué dentro de la base de datos.

Comportamiento de los Usuarios según consiga:
Al verificar el comportamiento de admin_user y read_user, se evidencia que:
admin_user puede realizar todas las operaciones, incluyendo INSERT, UPDATE y lecturas directas de las tablas.
read_user, con permisos de solo lectura y ejecución de procedimientos, puede leer datos y ejecutar procedimientos almacenados, pero no puede realizar INSERT directos a las tablas.
