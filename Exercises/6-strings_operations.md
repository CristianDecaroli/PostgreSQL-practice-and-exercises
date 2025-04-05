# 🔤 **Operaciones con Strings en PostgreSQL**  

Las operaciones con **strings** en la mayoría de los **RDBMS** pueden ser **innecesariamente complicadas**. Afortunadamente, **PostgreSQL** maneja esto mejor que otros sistemas, proporcionando **soporte avanzado para expresiones regulares**.  

En esta sección, exploraremos:  
✅ **Manipulación básica de strings**  
✅ Uso del operador **LIKE**  
✅ Uso de **expresiones regulares**  
✅ Alternativas que funcionan en la mayoría de los **RDBMS**  

📌 **Si no estás familiarizado con estas funciones, te recomiendo revisar la [documentación de PostgreSQL sobre funciones de strings](https://www.postgresql.org/docs/current/functions-string.html).**  

📖 También es recomendable el libro *SQL Cookbook* de **Anthony Molinaro**, que documenta en profundidad la manipulación de strings en SQL compatible con múltiples bases de datos.  

---

### **1. Formatear los nombres de los miembros**  
Mostrar los nombres de **todos los miembros**, formateados como:  
📌 `'Apellido, Nombre'`  

---

### **2. Buscar instalaciones por prefijo de nombre**  
Encontrar todas las instalaciones cuyo **nombre comience con 'Tennis'**.  
📌 **Recuperar todas las columnas.**  

---

### **3. Realizar una búsqueda sin distinción entre mayúsculas y minúsculas**  
Realizar una **búsqueda insensible a mayúsculas/minúsculas** para encontrar todas las instalaciones cuyo **nombre comience con 'tennis'**.  
📌 **Recuperar todas las columnas.**  

---

### **4. Encontrar números de teléfono con paréntesis**  
La tabla de **miembros** tiene números de teléfono **con formatos inconsistentes**. Queremos encontrar todos los **números que contienen paréntesis**.  

📌 **Salida:**  
- `member_id`  
- `telephone_number`  

📌 **Ordenar por:** `member_id`  

---

### **5. Rellenar códigos postales con ceros a la izquierda**  
Los códigos postales en la base de datos han **perdido los ceros a la izquierda** al ser almacenados como un **tipo numérico**.  
📌 **Recuperar todos los códigos postales**, asegurándose de que todos tengan **al menos 5 caracteres**, agregando ceros a la izquierda cuando sea necesario.  

📌 **Ordenar por el código postal corregido.**  

---

### **6. Contar la cantidad de miembros cuyo apellido empieza con cada letra**  
Generar un **conteo** de cuántos miembros tienen un **apellido que comienza con cada letra del alfabeto**.  

📌 **Ordenar por:** la letra inicial del apellido.  

📌 **No incluir letras sin miembros asociados.**  

---

### **7. Limpiar los números de teléfono**  
Los números de teléfono en la base de datos **tienen formatos muy inconsistentes**. Queremos imprimir una lista con los **IDs de los miembros** y sus números de teléfono, **eliminando los caracteres especiales**:  
❌ `-`  
❌ `(`  
❌ `)`  
❌ Espacios en blanco  

📌 **Ordenar por:** `member_id`  

---