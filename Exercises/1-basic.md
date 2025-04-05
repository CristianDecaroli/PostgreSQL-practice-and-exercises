# 🧠 Consultas SQL Simples (PostgreSQL)

Esta categoría cubre lo básico de SQL: cláusulas `SELECT` y `WHERE`, expresiones `CASE`, uniones (`UNION`) y otros conceptos elementales. Si ya tenés conocimientos previos de SQL, probablemente te resulten fáciles estos ejercicios. Si no, ¡es un buen punto de partida antes de avanzar a temas más complejos!

---

### 1. Recuperar todos los registros de una tabla  
¿Cómo podés obtener toda la información de la tabla `cd.facilities`?

---

### 2. Recuperar columnas específicas  
Querés mostrar una lista de todas las instalaciones y su costo para socios. ¿Cómo consultar solo los nombres de las instalaciones y sus costos?

---

### 3. Filtrar filas según condiciones  
¿Cómo obtener una lista de instalaciones que cobran una tarifa a los socios?

---

### 4. Filtrar con múltiples condiciones  
¿Cómo obtener una lista de instalaciones que cobran una tarifa a los socios **y** cuya tarifa es menor a 1/50 del costo de mantenimiento mensual? Mostrá el ID, el nombre, el costo para socios y el costo de mantenimiento mensual.

---

### 5. Búsqueda de texto básica  
¿Cómo generar una lista de todas las instalaciones que contienen la palabra `'Tennis'` en su nombre?

---

### 6. Coincidencia con múltiples valores  
¿Cómo obtener los detalles de las instalaciones con ID 1 y 5, **sin** usar el operador `OR`?

---

### 7. Clasificación de resultados en categorías  
¿Cómo generar una lista de instalaciones, etiquetadas como `'cheap'` o `'expensive'` dependiendo de si su costo de mantenimiento mensual supera los $100? Mostrá el nombre y el costo de mantenimiento mensual.

---

### 8. Trabajar con fechas  
¿Cómo obtener una lista de socios que se unieron después del **1 de septiembre de 2012**? Mostrá el ID, apellido, nombre y fecha de ingreso.

---

### 9. Eliminar duplicados y ordenar resultados  
¿Cómo generar una lista ordenada de los **primeros 10 apellidos** en la tabla de socios, sin repetir apellidos?

---

### 10. Combinar resultados de múltiples consultas  
Querés una lista combinada de todos los apellidos de los socios y todos los nombres de instalaciones. Sí, es un ejemplo forzado 😄. ¡Pero hacelo igual!

---

### 11. Agregación simple  
Querés saber la **fecha de ingreso** del socio más reciente. ¿Cómo podrías consultarla?

---

### 12. Agregación avanzada  
Ahora querés saber el **nombre y apellido** del (o los) último(s) socio(s) en registrarse, no solo la fecha. ¿Cómo lo harías?

---