Cohesion  Principios solid,

Programación funcional -> Funciones puras, no hayan efectos secundarios. No afecta a elementos fuera de la función.

No se puede manipular una variable fuera de la función. Inmutabilidad. No se cambian los valores.

Si se hace, el sistema impide modificarlo.

En Java, las variables globales, si se modifica en alguna parte del código, esta afectará a demás partes.

Para que sea funcional debe cumplir con: Funciones puras, inmutabilidad, funciones de orden superior:
Se envía como parametro otra función. Aquí el comportamiento cambia similar a
Interfaz funcional.

Evaluación perezosa, el código se ejecuta solo cuando se necesita como las expresiones de lambda... 

Según el problema se usa uno u otro.
Ensamblador, Programación secuencial.

Paradigma imperativo, procedural, divide las tareas en procedimientos.

Paradigma estructurado..

POO... Salto en la programación. Soluciona problemas más complejos desde que se traduce del mundo real a lenguaje. Aplicaciones robustas.

Paradigma Funcional.50s-presente

Orientado a eventos. reactivo. Responde a eventos como clics, movimientos dle ratón o señales externas.
Concurrentes y distribuidos.

Era modernas.

Recomendacion de saltar por paradigmas.



Paradigma funcional es una programación declarativa.

Existe la declarativa(que hace) y la imperativa(como hace)

elixir y su uso en la industria.

.stream no maneja la lista original sino una auxiliar. (inmutabilidad)

.map transformación intermedia tiene un objeto de tipo list y lo transforma. Lo mapea lo convierte, 

list.of(1,2,3,4) 
aqui map convierte el stream en cuadrados.

.reduce(acumulador incio, Integer::sum)

que es el Integer::sum 
reduce espera una función, la función aqui es Integer es un wrapper, clase envoltura. (función de orden superior reduce

a.pintar(Dato::pintarMueble)
a.pintar(Dato::pintarCarro)
el método pintar tiene pasos distintos según el contexto.

Aqui entra la evualuación perezosa
si no se usa ::pintar y se usa el .pintar se estaría llamando el método. Con el punto la ejecuta en el momento. Llamado por referencia. clase.metodo

metodo estaticos 


porque escribir lo mismo de forma distinta? porque es diferente? que ventajas y desventajas.

String, es una clase, es un arreglo de <char>. También es envoltura.
Clases wrapper: Integer, String

la desventaja de un lenguaje no tipado es legibilidad.

# Programación: Paradigmas y Principios

## SOLID y Cohesión

### Programación Funcional
- **Funciones puras**: Sin efectos secundarios, no afectan elementos fuera de la función
- **Inmutabilidad**: No se modifican valores. El sistema impide cambios
- **Problema en Java**: Variables globales modificadas en una parte afectan el resto del código

**Requisitos para funcional:**
1. Funciones puras
2. Inmutabilidad
3. Funciones de orden superior (parámetro función)
4. Evaluación perezosa (ejecución solo cuando se necesita)

### Paradigmas de Programación

| Paradigma | Características |
|-----------|-----------------|
| Imperativo/Procedural | Divide tareas en procedimientos |
| Estructurado | Orden secuencial |
| POO | Traduce mundo real a código, aplicaciones robustas |
| Funcional | Programación declarativa (años 50-presente) |
| Orientado a eventos | Reactivo, responde a clics/señales externas |
| Concurrente/Distribuido | Ejecución paralela |

### Declarativo vs Imperativo
- **Declarativo**: QUÉ hacer
- **Imperativo**: CÓMO hacerlo

---

## Conceptos Clave en Java

### Streams e Inmutabilidad
```java
list.of(1,2,3,4)
    .stream()
    .map(x -> x * x)  // Transformación intermedia
    .reduce(0, Integer::sum)  // Acumulación
```

- `.stream()`: No modifica lista original
- `.map()`: Transforma elementos
- `.reduce()`: Función de orden superior que espera una función

### Referencias de Métodos
```java
a.pintar(Dato::pintarMueble)  // Llamada por referencia
a.pintar(Dato::pintarCarro)   // Evaluación perezosa
```

**Diferencia:**
- `Dato::pintar` → Referencia (evaluación perezosa)
- `Dato.pintar()` → Ejecución inmediata

### Clases Wrapper
- `Integer`, `String`: Clases envolturas (tipos primitivos)
- `String`: Arreglo de `<char>`

---

## Consideraciones de Diseño

**¿Por qué escribir lo mismo de forma distinta?**
- Diferentes contextos requieren diferentes enfoques
- Distintas ventajas/desventajas según uso

**Tipado:** Lenguajes no tipados sacrifican legibilidad
