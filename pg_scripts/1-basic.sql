/* Recuperar todo de una tabla:
¿Cómo puedes recuperar toda la información de la tabla cd.facilities? */
SELECT * FROM cd.facilities;

/* Recuperar columnas específicas de una tabla:
Quieres imprimir una lista de todas las instalaciones y su costo para los miembros. 
¿Cómo recuperarías una lista que contenga solo los nombres de las instalaciones y sus costos? */
SELECT name, membercost FROM cd.facilities;

/* Controlar qué filas se recuperan:
¿Cómo puedes producir una lista de instalaciones que cobran una tarifa a los miembros? */
SELECT * FROM cd.facilities
WHERE membercost > 0;

/* Controlar qué filas se recuperan - parte 2:
¿Cómo puedes producir una lista de instalaciones que cobran una tarifa a los miembros, y que esa tarifa sea menor a 1/50 del costo mensual de mantenimiento?
Devuelve el facid, el nombre de la instalación, el costo para los miembros y el mantenimiento mensual de las instalaciones en cuestión. */
SELECT facid, name, membercost, monthlymaintenance 
FROM cd.facilities 
WHERE membercost > 0 AND (membercost < monthlymaintenance/50);

/* Búsquedas básicas en cadenas de texto:
¿Cómo puedes producir una lista de todas las instalaciones que contengan la palabra 'Tennis' en su nombre? */
SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';

/* Comparación con varios valores posibles:
¿Cómo puedes recuperar los detalles de las instalaciones con ID 1 y 5? 
Intenta hacerlo sin utilizar el operador OR. */
SELECT * FROM cd.facilities
WHERE facid IN (1, 5);

/* Clasificación de los resultados en categorías:
¿Cómo se puede generar una lista de instalaciones, etiquetando cada una como «barata» o «cara» 
dependiendo de si su costo mensual de mantenimiento es superior a 100 dólares? 
Devuelve el nombre y el mantenimiento mensual de las instalaciones en cuestión. */
SELECT name, 
    CASE 
        WHEN monthlymaintenance > 100 THEN 'expensive' 
        ELSE 'cheap' 
    END AS cost
FROM cd.facilities;

/* Trabajar con fechas:
¿Cómo puedes generar una lista de los miembros que se unieron después del inicio de septiembre de 2012?
Devuelve el memid, apellido, nombre y fecha de ingreso de los miembros en cuestión. */
SELECT memid,surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

/* Eliminar duplicados y ordenar resultados:
¿Cómo puedes producir una lista ordenada de los primeros 10 apellidos en la tabla de miembros? 
La lista no debe contener duplicados. */
SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;

/* Combinar resultados de múltiples consultas:
Por alguna razón, quieres una lista combinada de todos los apellidos y nombres de instalaciones. 
Sí, este es un ejemplo forzado :-). ¡Genera esa lista! */
SELECT DISTINCT surname FROM cd.members
UNION
SELECT name FROM cd.facilities;

/* Agregación simple:
A usted le gustaría obtener la fecha de registro de su último miembro. 
¿Cómo se puede recuperar esta información?*/
SELECT MAX(joindate) as latest FROM cd.members

/* Más agregación:
Quieres obtener la fecha de inscripción del último miembro. ¿Cómo puedes recuperar esta información? */
SELECT firstname, surname, joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;