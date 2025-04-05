# 🔗 Joins y Subqueries (PostgreSQL)

Esta categoría trata principalmente de un concepto fundamental en los sistemas de bases de datos relacionales: los **joins** (uniones). Las uniones permiten combinar información relacionada de múltiples tablas para responder preguntas complejas. No solo hacen más fácil la consulta: la falta de uniones suele llevar a desnormalizar datos, lo que complica mantener la coherencia de la información.

Este tema cubre `INNER JOIN`, `OUTER JOIN`, `SELF JOIN`, y también dedica algo de tiempo a **subconsultas** (consultas dentro de otras consultas).

---

### 1. Obtener los horarios de inicio de las reservas de un miembro  
¿Cómo generar una lista con los horarios de inicio de las reservas hechas por miembros llamados **'David Farrell'**?

---

### 2. Horarios de reservas para canchas de tenis  
¿Cómo obtener una lista con los horarios de inicio de las reservas de **canchas de tenis** para la fecha **2012-09-21**? Mostrá los horarios junto al nombre de la instalación, ordenados por hora.

---

### 3. Listar miembros que recomendaron a otros  
¿Cómo obtener una lista de todos los miembros que han recomendado a otro miembro? Asegurate de **no incluir duplicados** y ordená los resultados por **apellido y nombre**.

---

### 4. Listar miembros junto a quien los recomendó  
¿Cómo mostrar una lista de todos los miembros, incluyendo (si existe) a la persona que los recomendó? Ordená los resultados por **apellido y nombre**.

---

### 5. Miembros que usaron una cancha de tenis  
¿Cómo generar una lista de miembros que han usado alguna **cancha de tenis**? Incluí el **nombre de la cancha** y el **nombre del miembro** en una única columna. No debe haber datos duplicados y debe estar ordenado por **nombre del miembro y nombre de la instalación**.

---

### 6. Reservas costosas  
¿Cómo listar las reservas realizadas el **14 de septiembre de 2012** que costaron al miembro (o invitado) **más de $30**? Recordá que los **invitados** tienen precios distintos y que el **ID 0** representa al usuario invitado. Mostrá el **nombre de la instalación**, el **nombre del miembro** (en una sola columna) y el **costo**. Ordená por **costo descendente** y **no uses subconsultas**.

---

### 7. Miembros y sus recomendadores, sin usar joins  
¿Cómo mostrar una lista de todos los miembros junto con la persona que los recomendó (si existe), **sin utilizar joins**? Asegurate de no mostrar duplicados y que el **nombre completo (nombre + apellido)** esté formateado en una sola columna y ordenado.

---

### 8. Reservas costosas, usando subconsulta  
La consulta de reservas costosas anterior requería calcular el costo tanto en la cláusula `WHERE` como en una `CASE`. ¿Podés simplificar esa lógica usando **subconsultas**?

Recordá:  
> ¿Cómo generar una lista de reservas del día **2012-09-14** que costaron al miembro o invitado **más de $30**? Tené en cuenta que los invitados tienen tarifas distintas y que el ID 0 representa al invitado. Mostrá el **nombre de la instalación**, el **nombre del miembro** (en una sola columna) y el **costo**. Ordená por **costo descendente**.

---