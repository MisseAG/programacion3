# Construir dos procesos t1 y t2 independientes que realicen:
#
# t1(s1) suma de los números debajo de la diagonal principal = a
# t2(s2) promedio de todos los números = b
#
# Cuando terminan:
# s3 -> c = a * b
# s4 -> imprimir c
#
# El main debe esperar a t1 y t2 usando Task.await

defmodule Matriz do
  defstruct matriz: [
              [60, 22, 41, 5],
              [13, 33, 44, 5],
              [89, 10, 100, 99],
              [5, 101, 6, 34]
            ]

  def main do
    m = %Matriz{}.matriz

    # t1 -> s1: suma debajo de la diagonal principal
    # 1,0
    # 2,0 2,1
    # 3,0 3,1 3,2
    t1 =
      Task.async(fn ->
        suma_debajo_diagonal(m)
      end)

    # t2 -> s2: promedio de toda la matriz
    t2 =
      Task.async(fn ->
        promedio(m)
      end)

    # Esperar resultados
    a = Task.await(t1)
    b = Task.await(t2)

    # s3 -> c = a * b
    c = multiplicar(a, b)

    # s4 -> imprimir c
    IO.puts("c = #{c}")

    IO.puts("a = #{a}")
    IO.puts("b = #{b}")
  end

  # s1: suma de los elementos debajo de la diagonal principal
  def suma_debajo_diagonal(matriz) do
    matriz
    |> Enum.with_index()
    |> Enum.reduce(0, fn {fila, i}, acc ->
      suma_fila =
        fila
        |> Enum.with_index()
        |> Enum.reduce(0, fn {valor, j}, suma ->
          # condición: fila > columna
          if i > j do
            suma + valor
          else
            suma
          end
        end)

      acc + suma_fila
    end)
  end

  # s2: promedio de todos los elementos
  def promedio(matriz) do
    fila = obtener_filas_matriz(matriz)
    suma = Enum.sum(fila)
    cantidad = length(fila)

    suma / cantidad
  end

  def obtener_filas_matriz([fila | resto_filas]) do
    fila ++ obtener_filas_matriz(resto_filas)
  end

  def obtener_filas_matriz([]) do
    []
  end

  # s3: multiplicación
  def multiplicar(a, b) do
    a * b
  end
end

Matriz.main()
