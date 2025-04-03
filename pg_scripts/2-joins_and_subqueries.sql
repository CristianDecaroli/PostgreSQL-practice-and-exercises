/* Obtener los horarios de inicio de las reservas de los miembros:
¿Cómo se puede generar una lista con los horarios de inicio de las reservas realizadas 
por miembros llamados 'David Farrell'? */
SELECT bks.starttime FROM cd.bookings bks
INNER JOIN cd.members mems ON mems.memid = bks.memid
WHERE mems.firstname='David' AND mems.surname='Farrell';    

/* Determinar los horarios de inicio de las reservas en canchas de tenis:
¿Cómo se puede generar una lista con los horarios de inicio de las reservas en canchas de tenis para la fecha '2012-09-21'? 
Devolver una lista con los pares de horario de inicio y nombre del facility, ordenados por el horario. */
SELECT bks.starttime, facs.name
FROM cd.bookings bks
INNER JOIN cd.facilities facs ON bks.facid = facs.facid
WHERE DATE(bks.starttime) = '2012-09-21' 
AND facs.name LIKE 'Tennis%'
ORDER BY bks.starttime;

/* Generar una lista de todos los miembros que han recomendado a otro miembro:
¿Cómo se puede generar una lista de todos los miembros que han recomendado a otro miembro? 
Asegurar que no haya duplicados en la lista y que los resultados estén ordenados por (apellido, nombre). */
SELECT DISTINCT recs.firstname, recs.surname FROM cd.members mems
INNER JOIN cd.members recs 
ON recs.memid = mems.recommendedby
ORDER BY surname, firstname;

/* Generar una lista de todos los miembros junto con su recomendador:
¿Cómo se puede generar una lista de todos los miembros, incluyendo la persona que los recomendó (si la hay)? 
Asegurar que los resultados estén ordenados por (apellido, nombre). */
select 
	mems.firstname as memfname, mems.surname as memsname, 
	recs.firstname as recfname, recs.surname as recsname
FROM cd.members mems 
LEFT OUTER JOIN cd.members recs ON recs.memid = mems.recommendedby
ORDER BY memsname, memfname;

/* Generar una lista de todos los miembros que han utilizado una cancha de tenis:
¿Cómo se puede generar una lista de todos los miembros que han utilizado una cancha de tenis? 
Incluir en la salida el nombre de la cancha y el nombre del miembro formateado en una única columna. 
Asegurar que no haya datos duplicados y ordenar por el nombre del miembro seguido del nombre del facility. */
SELECT DISTINCT 
	mems.firstname || ' ' || mems.surname as member, 
	facs.name as facility
FROM cd.members mems
INNER JOIN cd.bookings bks ON mems.memid = bks.memid
INNER JOIN cd.facilities facs ON bks.facid = facs.facid
WHERE facs.name LIKE 'Tennis%'
ORDER BY member, facility 

/* Generar una lista de reservas costosas:
¿Cómo se puede generar una lista de reservas para el día 2012-09-14 que le cuesten al miembro (o invitado) 
más de $30? Recordar que los invitados tienen costos diferentes a los miembros (los costos listados son por 
franja de media hora) y que el usuario invitado siempre tiene ID 0. 
Incluir en la salida el nombre del facility, el nombre del miembro formateado en una única columna y el costo. 
Ordenar por costo en orden descendente, sin usar subconsultas. */
SELECT 
    mems.firstname || ' ' || mems.surname AS member, 
    facs.name AS facility, 
    CASE
        WHEN mems.memid = 0 
            THEN bks.slots * facs.guestcost
        ELSE bks.slots * facs.membercost
    END AS cost
FROM cd.members mems
INNER JOIN cd.bookings bks ON mems.memid = bks.memid
INNER JOIN cd.facilities facs ON bks.facid = facs.facid
WHERE 
    bks.starttime >= '2012-09-14' 
    AND bks.starttime < '2012-09-15' 
    AND ((mems.memid = 0 AND bks.slots * facs.guestcost > 30) OR (mems.memid != 0 AND bks.slots * facs.membercost > 30))
ORDER BY cost DESC;

/* Generar una lista de todos los miembros junto con su recomendador, sin usar joins:
¿Cómo se puede generar una lista de todos los miembros, incluyendo la persona que los recomendó (si la hay), 
sin utilizar joins? Asegurar que no haya duplicados en la lista y que cada combinación de nombre + 
apellido esté formateada como una columna y ordenada. */
SELECT DISTINCT
	mems.firstname || ' ' || mems.surname AS member,
	(SELECT recs.firstname || ' ' || recs.surname AS recommender
	 	FROM cd.members recs
	 	WHERE recs.memid = mems.recommendedby
	 )
	 FROM cd.members mems
ORDER BY member;


/* Generar una lista de reservas costosas utilizando una subconsulta:
El ejercicio de generar una lista de reservas costosas contenía una lógica desordenada, 
se tenía que calcular el costo de la reserva tanto en la cláusula WHERE como en la sentencia CASE. 
Intentar simplificar este cálculo utilizando subconsultas. Como referencia, la pregunta era:
¿Cómo se puede generar una lista de reservas para el día 2012-09-14 que le cuesten al miembro (o invitado) 
más de $30? Recordar que los invitados tienen costos diferentes a los miembros (los costos listados son por 
franja de media hora) y que el usuario invitado siempre tiene ID 0. 
Incluir en la salida el nombre del facility, el nombre del miembro formateado en una única columna y el costo. 
Ordenar por costo en orden descendente. */
SELECT member, facility, cost FROM (
	SELECT 
		mems.firstname || ' ' || mems.surname AS member,
		facs.name AS facility,
		case
			when mems.memid = 0 then
				bks.slots*facs.guestcost
			else
				bks.slots*facs.membercost
		end AS cost
		FROM cd.members mems
  		INNER JOIN cd.bookings bks ON mems.memid = bks.memid
		INNER JOIN cd.facilities facs ON bks.facid = facs.facid
		WHERE bks.starttime >= '2012-09-14' AND bks.starttime < '2012-09-15'
	) AS bookings
	WHERE cost > 30
ORDER BY cost DESC;
