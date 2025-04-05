# 🔄 **Consultas Recursivas en PostgreSQL**  

Las **Common Table Expressions (CTE)** nos permiten crear **tablas temporales** dentro de una consulta, facilitando la **lectura y organización del código SQL**.  

📌 **¿Qué es `WITH RECURSIVE`?**  
El modificador **`WITH RECURSIVE`** permite construir **consultas recursivas**, lo que es **enormemente útil** para trabajar con **estructuras de datos en árbol o grafos**.  

✅ **Ejemplo práctico:** Obtener **todas las relaciones** de un nodo en un grafo hasta una determinada profundidad.  

📌 **En esta sección exploraremos consultas recursivas básicas aplicadas a nuestro dataset.**  

---

### **1. Encontrar la cadena de recomendaciones hacia arriba para el miembro con ID 27**  
Queremos encontrar **quién recomendó al miembro con ID 27**, luego **quién recomendó a esa persona**, y así sucesivamente.  

📌 **Salida:**  
- `member_id`  
- `first_name`  
- `surname`  

📌 **Ordenar por:** `member_id` en orden **descendente**.  

---

### **2. Encontrar la cadena de recomendaciones hacia abajo para el miembro con ID 1**  
Queremos encontrar a **todos los miembros recomendados** por el miembro con ID 1, luego a los miembros que **fueron recomendados por ellos**, y así sucesivamente.  

📌 **Salida:**  
- `member_id`  
- `name`  

📌 **Ordenar por:** `member_id` en orden **ascendente**.  

---

### **3. Crear una CTE que devuelva la cadena de recomendaciones hacia arriba para cualquier miembro**  
Generar una **CTE** que permita obtener la **cadena de recomendaciones hacia arriba** para cualquier miembro.  

📌 **Consulta esperada:**  
```sql
SELECT recommender FROM recommenders WHERE member = x;
```
📌 **Demostrar con los IDs:** `12` y `22`.  

📌 **Salida:**  
- `member`  
- `recommender`  

📌 **Ordenar por:**  
- `member` en orden **ascendente**  
- `recommender` en orden **descendente**  

---