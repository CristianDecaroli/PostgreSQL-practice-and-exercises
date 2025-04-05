# 📊 **Agregación en PostgreSQL**

La agregación es una de esas funcionalidades que realmente te hacen apreciar el poder de los sistemas de bases de datos relacionales. No solo te permite almacenar información, sino también hacer **preguntas interesantes** que pueden ayudarte en la toma de decisiones.  

Esta sección cubre en detalle las funciones de agregación, desde las **agregaciones estándar con GROUP BY** hasta el uso de **window functions**.

---

### **1. Contar el número de instalaciones**  
Como primera incursión en la agregación, haremos algo simple: queremos saber **cuántas instalaciones existen** en la base de datos. Debemos producir un **conteo total**.

---

### **2. Contar el número de instalaciones costosas**  
Generar un **conteo** de las instalaciones cuyo `guestcost` sea **10 o más**.

---

### **3. Contar el número de recomendaciones hechas por cada miembro**  
Obtener el número de recomendaciones que ha hecho cada miembro. **Ordenar por `member_id`**.

---

### **4. Listar el total de slots reservados por instalación**  
Generar una lista con el **número total de slots reservados** por cada instalación. La salida debe contener **`facility_id` y `slots`**, ordenados por `facility_id`.

---

### **5. Listar el total de slots reservados por instalación en un mes específico**  
Generar una lista con el **número total de slots reservados** por instalación durante el mes de **septiembre de 2012**. La salida debe estar **ordenada por la cantidad de slots**.

---

### **6. Listar el total de slots reservados por instalación por mes**  
Generar una lista con el número total de **slots reservados por instalación por mes en 2012**. La salida debe contener **`facility_id`, `month` y `slots`**, ordenados por `facility_id` y mes.

---

### **7. Contar los miembros que han realizado al menos una reserva**  
Determinar el número total de miembros (incluyendo invitados) que **han realizado al menos una reserva**.

---

### **8. Listar instalaciones con más de 1000 slots reservados**  
Generar una lista de **instalaciones con más de 1000 slots reservados**. La salida debe contener **`facility_id` y `slots`**, ordenados por `facility_id`.

---

### **9. Calcular el ingreso total de cada instalación**  
Generar una lista con el **nombre de cada instalación y su ingreso total**. La salida debe estar **ordenada por revenue**, y recordar que los costos para miembros e invitados son diferentes.

---

### **10. Encontrar instalaciones con ingresos totales menores a 1000**  
Generar una lista de **instalaciones con un revenue menor a 1000**. La salida debe contener **`facility_name` y `revenue`**, ordenada por revenue.

---

### **11. Obtener el `facility_id` con más slots reservados**  
Determinar qué instalación tiene la **mayor cantidad de slots reservados**.  
💡 **Extra:** Intentar una versión **sin `LIMIT`**, aunque pueda verse más compleja.

---

### **12. Listar el total de slots reservados por instalación por mes (Parte 2)**  
Extender el ejercicio anterior agregando **totales por instalación** y un **total global para todas las instalaciones**.  
Las columnas `month` y `facility_id` deben mostrar **NULL** en los valores totales.

---

### **13. Listar el total de horas reservadas por instalación**  
Cada slot dura **30 minutos**, por lo que debemos calcular la cantidad de **horas reservadas por instalación**.  
La salida debe contener **`facility_id`, `name` y `hours_booked`**, formateando los valores a **dos decimales**.

---

### **14. Listar la primera reserva de cada miembro después del 1 de septiembre de 2012**  
Generar una lista con **nombre, ID y la primera reserva** de cada miembro después de **01/09/2012**. Ordenar por `member_id`.

---

### **15. Listar nombres de miembros con el total de miembros en cada fila**  
Generar una lista de nombres de miembros, donde **cada fila contenga el total de miembros**.  
Ordenar por **`join_date`** e incluir **invitados**.

---

### **16. Generar una lista numerada de miembros**  
Crear una lista de miembros con una numeración **monotónicamente creciente**, ordenada por **fecha de ingreso**.  
📌 **Importante:** `member_id` **no** es secuencial.

---

### **17. Encontrar el `facility_id` con más slots reservados (de nuevo)**  
Como antes, determinar **qué instalación tiene más slots reservados**, pero asegurarse de que **en caso de empate, todas las instalaciones empatadas se incluyan en la salida**.

---

### **18. Ranquear miembros por horas reservadas (redondeadas)**  
Generar una lista de miembros (incluyendo invitados), junto con la cantidad de **horas reservadas**, **redondeadas a la decena más cercana**.  
Mostrar **nombre, apellido, horas redondeadas y ranking**, ordenados por ranking, apellido y nombre.

---

### **19. Encontrar las 3 instalaciones con mayor revenue**  
Generar una lista de las **tres instalaciones con más revenue** (incluyendo empates).  
Mostrar **`facility_name` y `rank`**, ordenado por ranking y nombre.

---

### **20. Clasificar instalaciones por revenue**  
Clasificar las instalaciones en **tres grupos** (alto, medio y bajo) según su revenue. Ordenar por clasificación y nombre.

---

### **21. Calcular el tiempo de recuperación de inversión por instalación**  
Usando los **tres primeros meses completos de datos**, calcular **cuántos meses tomará recuperar el costo de cada instalación**, teniendo en cuenta los **costos de mantenimiento mensuales**.  
📌 **Nota:** No es necesario considerar la variación en la cantidad de días de cada mes, solo queremos un valor aproximado.

---

### **22. Calcular un promedio móvil de revenue**  
Para **cada día de agosto de 2012**, calcular el **promedio móvil de revenue de los últimos 15 días**.  
📌 **Considerar días con revenue = 0** en el cálculo.  
💡 **Pista:** Puede ser un desafío, no dudes en investigar cómo hacerlo.

---