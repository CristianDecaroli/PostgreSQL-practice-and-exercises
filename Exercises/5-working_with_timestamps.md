# 🕒 **Trabajando con Timestamps en PostgreSQL**  

Las fechas y horas en SQL son un **tema complejo**, lo suficientemente amplio como para merecer su propia categoría. Sin embargo, también son **extremadamente poderosas**, permitiendo trabajar con conceptos de **longitud variable** como los *meses* de forma más sencilla que en muchos lenguajes de programación.  

Antes de comenzar, es recomendable revisar la [documentación de PostgreSQL sobre funciones de fecha y hora](https://www.postgresql.org/docs/current/functions-datetime.html). También puede ser útil haber completado la categoría de **funciones de agregación**, ya que en esta sección utilizaremos algunas de ellas.  

---

### **1. Generar un timestamp para la 1 a.m. del 31 de agosto de 2012**  
Crear un **timestamp** que represente la **1:00 a.m.** del **31 de agosto de 2012**.  

---

### **2. Restar timestamps entre sí**  
Calcular la diferencia entre los timestamps **'2012-08-31 01:00:00'** y **'2012-07-30 01:00:00'**.  

---

### **3. Generar una lista de todas las fechas de octubre de 2012**  
Crear una lista con todas las **fechas de octubre de 2012**. La salida puede ser en formato **timestamp (con la hora en medianoche) o como una fecha (`DATE`)**.  

---

### **4. Obtener el día del mes desde un timestamp**  
Extraer el **día del mes** del timestamp **'2012-08-31'** como un número entero.  

---

### **5. Calcular la cantidad de segundos entre dos timestamps**  
Determinar la **cantidad de segundos** entre los timestamps **'2012-08-31 01:00:00'** y **'2012-09-02 00:00:00'**.  

---

### **6. Calcular la cantidad de días en cada mes de 2012**  
Para cada **mes del año 2012**, devolver la cantidad de días que tiene.  
📌 **Formato de salida:**  
- Una columna con el **mes** (como un número entero).  
- Una segunda columna con la **cantidad de días** como un tipo de dato `INTERVAL`.  

---

### **7. Calcular la cantidad de días restantes en un mes**  
Para cualquier timestamp dado, calcular **cuántos días quedan en el mes**.  
📌 **Condiciones:**  
- **El día actual cuenta como un día completo**, sin importar la hora del timestamp.  
- Usar el timestamp **'2012-02-11 01:00:00'** como ejemplo.  
- **Formato de salida:** Un solo valor en formato `INTERVAL`.  

---

### **8. Calcular la hora de finalización de reservas**  
Generar una lista con la **hora de inicio y la hora de finalización** de las **últimas 10 reservas** en el sistema.  
📌 **Orden:**  
1. Por la **hora en que terminan**.  
2. En caso de empate, por la **hora en que comienzan**.  

---

### **9. Contar la cantidad de reservas por mes**  
Generar un conteo del **número de reservas realizadas en cada mes**, ordenado por **mes**.  

---

### **10. Calcular el porcentaje de utilización de cada instalación por mes**  
Calcular el **porcentaje de uso** de cada instalación por mes.  
📌 **Condiciones:**  
- **Horario de apertura:** 8:00 a.m.  
- **Horario de cierre:** 8:30 p.m.  
- Considerar **todos los días del mes**, aunque el club haya estado cerrado en algunos días.  
- **Redondear el porcentaje a 1 decimal**.  
- Ordenar por **nombre de la instalación y mes**.  

---