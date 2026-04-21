defmodule MatrizRecursividad do
  def main do
    matriz = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]

    recorrer_matriz(matriz)
    |> IO.inspect()

    recorrer_matriz_diagonal(matriz)
    |> IO.inspect()

    sumar_elementos_matriz(matriz)
    |> IO.inspect()

    matriz = [
      [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12],
      [13,14,15,16]
    ]
    recorrer_matriz_diagonal(matriz)
    |> IO.inspect()

    sumar_elementos_matriz(matriz)
    |> IO.inspect()

    matriz = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]
    sumar_elementos_diagonal_sec(matriz)
    |>IO.inspect()

    #simetric
    #valor máximo
    
  end

  defp sumar_elementos_diagonal_sec(matriz), do: sumar_elementos_diagonal_sec(matriz, 0)
  defp sumar_elementos_diagonal_sec([], _indice), do: 0
  defp sumar_elementos_diagonal_sec([fila | resto_filas], indice) do
    ManipularLista.read_number(fila, length(fila) - 1 - indice) + sumar_elementos_diagonal_sec(resto_filas, indice + 1)
  end


  defp recorrer_matriz([]), do: :ok

  defp recorrer_matriz([fila | resto_filas]) do
    recorrer_fila(fila)
    IO.puts("")   # Salto de línea después de cada fila
    recorrer_matriz(resto_filas)
    :ok
  end

  defp recorrer_fila([]), do: :ok
  defp recorrer_fila([elemento | resto]) do
    IO.write("#{elemento} ")
    recorrer_fila(resto)
    :ok
  end

  defp recorrer_matriz_diagonal(matriz), do: recorrer_matriz_diagonal(matriz, 0)
  defp recorrer_matriz_diagonal([], _indice), do: :ok
  defp recorrer_matriz_diagonal([fila | resto_filas], indice) do
    IO.write("#{ManipularLista.read_number(fila, indice)} ")
    recorrer_matriz_diagonal(resto_filas, indice + 1)
  end



  defp sumar_elementos_matriz([]), do: 0

  defp sumar_elementos_matriz([fila|resto_filas]) do
    sumar_filas(fila) + sumar_elementos_matriz(resto_filas)
  end

  defp sumar_filas([]), do: 0

  defp sumar_filas(fila) do
    ManipularLista.suma_numeros(fila)
  end
end

defmodule ManipularLista do
  def suma_numeros([]), do: 0
  def suma_numeros([h | t]), do: h + suma_numeros(t)
  def read_number(list, index) do
    Enum.at(list, index)
  end
end

MatrizRecursividad.main()
