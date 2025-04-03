/*Inserta algunos datos en una tabla: 
El club está agregando una nueva instalación: un spa. 
Necesitamos agregarlo a la tabla `facilities`. Usa los siguientes valores:
facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.*/
insert into cd.facilities 
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
    values (9, 'Spa', 20, 30, 100000, 800); 

/*Inserta múltiples filas de datos en una tabla:
En el ejercicio anterior, aprendiste a agregar una 'facilitie'. Ahora vas a agregar múltiples 'facilities' 
en un solo comando. Usa los siguientes valores:
facid: 9, Nombre: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
facid: 10, Nombre: 'Squash Court 2', membercost: 3.5, guestcost: 17.5, initialoutlay: 5000, monthlymaintenance: 80. */
INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES
	(9, 'Spa', 20, 30, 100000, 800),
	(10, 'Squash Court 2', 3.5, 17.5, 5000, 80);      


/* Inserta datos calculados en una tabla:
Intentemos agregar el spa a la tabla facilities nuevamente. Sin embargo, esta vez queremos generar 
automáticamente el valor del próximo facid en lugar de especificarlo como una constante. 
Usa los siguientes valores para todo lo demás:
Nombre: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800. */
INSERT INTO cd.facilities
    (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
    SELECT (SELECT MAX(facid) FROM cd.facilities)+1, 'Spa', 20, 30, 100000, 800; 


/* Actualizar algunos datos existentes:
Cometimos un error al ingresar los datos de la segunda cancha de tenis. 
El initialoutlay fue 10000 en lugar de 8000. Debes modificar los datos para corregir el error. */
UPDATE cd.facilities
    SET initialoutlay = 10000
    WHERE facid = 1;

/* Actualizar múltiples filas y columnas al mismo tiempo
Queremos aumentar el precio de las canchas de tenis tanto para miembros como para invitados. 
Actualiza los costos a 6 para miembros y 30 para invitados. */
UPDATE cd.facilities
SET membercost = 6, guestcost = 30
WHERE facid in (0, 1);


/* Actualizar una fila basándose en el contenido de otra fila:
Queremos modificar el precio de la segunda cancha de tenis para que cueste un 10% más que la primera. 
Intenta hacerlo sin usar valores constantes para los precios, 
de modo que podamos reutilizar la consulta en el futuro. */
UPDATE cd.facilities facs
    SET
        membercost = (SELECT membercost * 1.1 FROM cd.facilities WHERE facid = 0),
        guestcost = (select guestcost * 1.1 FROM cd.facilities WHERE facid = 0)
    WHERE facs.facid = 1;  

/* Eliminar todas las reservas:
Como parte de una limpieza de nuestra base de datos, queremos eliminar todas las reservas de la tabla cd.bookings.
¿Cómo podemos lograr esto? */
DELETE FROM cd.bookings; /* OR */ TRUNCATE cd.bookings;

/* Eliminar un miembro de la tabla cd.members:
Queremos eliminar al miembro 37, quien nunca ha realizado una reserva, de nuestra base de datos.
¿Cómo podemos lograr esto? */
DELETE FROM cd.members
WHERE memid = 37;

/* Eliminar basado en una subconsulta:
En ejercicios anteriores, eliminamos a un miembro específico que nunca había realizado una reserva.
¿Cómo podemos hacer esto de manera más general para eliminar a todos los miembros que nunca han hecho una reserva? */
DELETE FROM cd.members WHERE memid NOT IN (SELECT memid FROM cd.bookings); 
/* OR */ 
DELETE FROM cd.members mems
WHERE NOT EXISTS (
  SELECT memid FROM cd.bookings
  WHERE memid = mems.memid);