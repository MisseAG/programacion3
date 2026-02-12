# Clase 2 10/02/2026 Concurrencia


---

## Elixir: Programación funcional y concurrente

Concurrente: Se pueden ejecutar varios procesos al tiempo

Ejemplo: Multitarea de Un SO. Sistema Concurrente. 


La concurrencia, se ejecutan "tareas a la vez", no realmente, porque necesitaría dos núcleos. No se ejecutan al tiempo. Es una ilusión, el so y el kernel, alterna los procesos con el tiempo. Planificador de tareas del SO. Tiempo y recursos del procesador

### Caracteristicas
---
#### Escalabilidad
Escalabilidad Horizontal: Aumenta fabricantes
Escalabilidad Vertical: Crea otra fábrica

Ejemplo: Amazon. Montar un app. PC nube mensual... Si el sistema empieza a crecer compra más infraestructura. Escaló

#### Mantenibilidad 
Mantenimiento. Fácilidad para hacer mantenimiento, corregir errores. 

#### Flexibilidad
Inmutabilidad. Cuando se modifica un componente, no se altera el resto

#### Eficiencia y tolerante a fallos
Si hay un solo error, el sistema puede seguir funcionando. Si un componente se daña, se reinicia y sigue funcionando.
- Excepciones. En elixir no se usan excepciones, se "deja" que el sistema falle. La despliega en otro, lo reinicia. 
- Dejar que falle. 
  
#### BEAM
- Bogdan Erlang Abstract Machine. Máquina virtual. Distinta a java.
- En un SO hay procesos. Aquí se instancia una máquina virtual, el programa no se ejecuta en el SO. 
- En C, se accede directamente a los recursos.
- En Java, se ejecuta sobre el JVM.
    JDK: Analizador léxico, sintáctico. No semántico. Kit de Librerías.
        JRE: Runtime.
            JVM: Virtual Machine. >JIT, Interprete, Runtime
    Compilador: javac. >Bytecode .class Código binario. de .java a .class 
- En Elixir, BEAM. 
  .exs -> compilador .ex -> Maquina virtual

- Java y Elixir son lenguajes compilados. Genera un ejecutable.
- Un lenguaje interpretado: Python, Javascript.

## Metaprogramación con la creación de DSL Domain-Specific Languages
- DSL: Alta abstracción para una clase de problemas especificos.
- Metaprogramación:  Programas que manipulan otros programas.
- En el DSL se crean funciones para declarar y mejorar la semántica, hacerlo más legible.

## Erlang
Lenguaje de programación.

C es a Java como Erlang es a Elixir

1. Elixir se ejecuta sobre Erlang. ¿Qué es Erlang y que características tiene?
2. ¿Qué ventajas tiene usar Elixir en lugar de Erlang? Hable de:
Distribuido, Concurrente, Resiliente, Velocidad, Fácil de usar
Actualización de código en vivo, árbol de supervisión,
Metaprogramación - DSL (Domain Specific Language)
NIF (Native Implemented Functions)
Se crean funciones nativas
3. Entonces, ¿Por qué deberías aprender Elixir? APIs con infraestructura rápida, backend consultas. 
4. ¿En qué tipo de proyecto es ideal usar Elixir? COmunicación en tiempo real. Velocidad.

## Lenguaje
Sintaxis: Estructura
, Semántica: Sentido
y Léxica: Lexemas, tokens, palabras reservadas

### Funciones de Orden Superior
Ejemplos de funciones de orden superior: .map, recibe una función anonima que se ejecuta, lambda.

Función anónima, no tiene nombre, y funciona como parámetro para funciones de orden superior. Trozos de código (comportamiento )que no están especificados en ninguna parte. Por lo tanto, no se invoca, sino que se establece directamente. 
- Ventaja: Mas especifico. No se crea nuevos modulos.
- Desventaja: No se reutiliza el comportamiento
- ¿Cuando se usa? Hay operaciones que como parametro tiene una lambda.

-Función que:
toma otra función como un valor para sus parámetros o
devuelve una función como resultado.

Permite manipular y procesar datos de manera flexible y escalable,
al permitir, por ejemplo, la composición de funciones.
Se suelen usar con Funciones anónimas (Funciones Lambda),
que son funciones que no tienen un nombre, pero se pueden asignar
a una variable o pasar como un argumento para una función.

### Evaluación Perezosa
Retrasa el calculo de la instrucción hasta necesitar el valor.
Mejora el rendimiento evitando calculos innecesarios.

Estrategia de evaluación que retrasa el cálculo de una expresión hasta que su valor
sea necesario.

Mejorar el rendimiento y la eficiencia del programa, al evitar evaluar expresiones
innecesarias.

### Transparencia Referencial
Una expresión una funcion es remplazada por su valor, su retorno.

Función pura. la entrada es igual a la salida. relacion con pipe
se puede quitar el bloque de código, se puede cambiar y mejorar. No depende de externos.
El lenguaje no permite que ocurra esto por su inmutabilidad.
Modificar listas no es posible. Evitar conflictos mentales.

Capacidad de una expresión de ser reemplazada por su valor sin afectar el
comportamiento del programa.
Esta asociado al concepto de Función pura.
Función que siempre debe dar la misma salida si ingresa la misma entrada.
función que no produce efectos secundarios, es decir, salidas diferentes al
valor de retorno.

### Inmutabilidad
- Las variables no cambian. 
- Característica que impide que los datos una vez creados, puedan ser modificados.
Para "modificar el valor", es necesario crear una nueva variable.
Algunas ventajas:
Seguridad en la concurrencia y la distribución
Facilidad de razonamiento (No hay efectos secundarios)
Facilita la depuración y el testing
Optimizaciones y rendimiento
Programación funcional más pura

### Pipelines
- Tuberia: La salida de una función será la entrada de otra función. Se concatena.
- Diseñado para procesamiento concurrente
- Proceso de movimiento y transformación de datos que se utiliza para:
extraer, transformar y cargar datos de una fuente a un destino.
Está diseñado para el procesamiento concurrente y paralelo.
  
## Practica

Todas las funciones retornan. 

Atomo: Una constante, que por valor tiene su nombre

:ok, es atomo, una tupla de respuesta.

un atomo se declara como :atom


## Notas

java: var Evoluciones del lenguaje. psvm cambió a void main. sout   
kuis de la próxima clase 2 preguntas, 2 correctas. 0 o 5
A usted se le da una lista de notas, para darle una beca a unos estudiantes con ciertos requisitos.

Parcial Semana 5 o 6 Jueves. Hoja Oficio ambos lados. 

Usar CMD. 
Partición de Configuración del Sistema Administrador
Crear Partición nueva.

C:
D: 

crear el workspace.
