# ✏️ Modificación de Datos (DML en PostgreSQL)

Consultar datos está bien, pero en algún momento seguramente vas a querer **insertar, actualizar o eliminar** información en tu base de datos. Esta sección se enfoca en esas operaciones, conocidas como **Lenguaje de Manipulación de Datos (DML, por sus siglas en inglés)**.

A diferencia de las consultas, estas operaciones **no devuelven resultados como respuesta**, sino que modifican el contenido de las tablas. Por eso, se mostrará el estado actualizado de la tabla para que compares con los **'Expected Results'** y verifiques tu solución.

---

### 1. Insertar un registro en una tabla  
El club está incorporando una nueva instalación: un **spa**. Tenemos que agregarlo en la tabla `facilities` con los siguientes valores:

```
facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800
```

---

### 2. Insertar múltiples registros en una tabla  
Ahora vas a agregar **varias instalaciones** en un solo comando. Usá los siguientes valores:

```
facid: 9, Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800  
facid: 10, Name: 'Squash Court 2', membercost: 3.5, guestcost: 17.5, initialoutlay: 5000, monthlymaintenance: 80
```

---

### 3. Insertar datos calculados en una tabla  
Vamos a intentar agregar el spa nuevamente, pero esta vez queremos **generar automáticamente** el valor de `facid` (sin especificarlo como constante). Usá los siguientes valores para el resto:

```
Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800
```

---

### 4. Actualizar un dato existente  
Se cometió un error al cargar la información de la segunda cancha de tenis. El valor correcto de `initialoutlay` es **10000**, no **8000**. Tenés que corregirlo.

---

### 5. Actualizar múltiples filas y columnas al mismo tiempo  
Queremos aumentar el precio de las canchas de tenis tanto para **miembros** como para **invitados**. Los nuevos precios deben ser:

```
membercost = 6  
guestcost = 30
```

---

### 6. Actualizar una fila en base al contenido de otra  
Queremos modificar el precio de la **segunda cancha de tenis** para que cueste **10% más** que la primera. Intentá hacerlo **sin usar valores constantes**, así podemos reutilizar la sentencia en el futuro.

---

### 7. Eliminar todas las reservas  
Como parte de una limpieza general, queremos **eliminar todos los registros de la tabla `cd.bookings`**. ¿Cómo podemos hacerlo?

---

### 8. Eliminar un miembro específico  
Queremos eliminar al **miembro con ID 37**, que **nunca hizo una reserva**. ¿Cómo lo hacemos?

---

### 9. Eliminar usando una subconsulta  
En el ejercicio anterior eliminamos un miembro específico que nunca hizo una reserva. ¿Cómo podríamos **generalizarlo** para eliminar **todos los miembros que nunca reservaron nada**?

---