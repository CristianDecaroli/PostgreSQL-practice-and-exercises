## Práctica de PostgreSQL

Este proyecto es un práctica de `PotgreSQL` y la realización de todos los ejercicios del sitio web: [https://pgexercises.com/](https://pgexercises.com/)

Si bien se puede practicar dentro del sitio web, preferí crear un entorno de trabajo instalando el cliente `PG Admin` localmente en mi computadora y correr el motor de bases de datos `PostgreSQL` en un contenedor de docker para simular una conexión remota.

---

Para inicializar contenedor y su base de datos deberás:

- Ejecutar en la consola `docker compose up -d`. 
- Abrir PGAdmin y conectarte al server con las credenciales definidas en el archivo `.env` + 'localhost' como name-hostaddress.

Al realizar esto, encontrarás la bbdd `exercises` con el schema `cd` y dentro las tres tablas `bookings`, `members` y `facilities`.

---