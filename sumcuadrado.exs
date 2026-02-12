defmodule SumaCuadrados do

  def suma_cuadrados(lista) do
    lista
    |> Enum.map(&(&1 * &1)) #Eleva al cuadrado cada elemento
    |> Enum.sum() #Suma resultados
  end

end

numeros = [1, 2, 3, 4]
resultado = SumaCuadrados.suma_cuadrados(numeros)
IO.puts("La suma de los cuadrados es: #{resultado}")
