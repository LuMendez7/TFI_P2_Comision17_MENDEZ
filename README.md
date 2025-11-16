TECNICATURA UNIVERSITARIA EN PROGRAMACIÓN (1º año).

Materia: Programación II.
Docentes titulares: Cortez, Alberto; Enferrel, Ariel; Rigoni, Cintia.
Docente tutor: Robledo, Juan Cruz.
Alumnno: Mendez Luciano.
Comisiñon Nº: 17
Nº de legajo: 18.718.

Este proyecto corresponde al Trabajo Final Integrador de la materua, cuyo objetivo genral es desarrollar una aplicación Java que implemente una relación 1 a 1 unidireccional entre las entidades Usuario y CredencialAcceso, utilizando JDBC, MySQL, patrón DAO, capa Service y manejo de transacciones.

El sistema permite realizar operaciones CRUD completas sobre ambas entidades, aplicando validaciones, baja lógica y consultas parametrizadas. La relación 1→1 se implementa mediante una clave foránea única en la tabla credencial_acceso, garantizando que cada usuario tenga a lo sumo una credencial asociada.

La aplicación está organizada en una arquitectura por capas:

entities: POJOs Usuario y CredencialAcceso

dao: DAOs JDBC con PreparedStatement

service: lógica de negocio y manejo de transacciones (commit/rollback)

config: conexión a MySQL

main: menú por consola para la interacción con el usuario

El repositorio incluye el código fuente del proyecto, los scripts SQL para crear la base de datos y cargar datos de prueba, el diagrama UML, el informe en formato PDF y el enlace al video de presentación del trabajo.
