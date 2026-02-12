#Suma de cuadrados de una lista de números
numbers = [1, 2, 3, 4]
result = numbers
|> Enum.map(&(&1 * &1))
|> Enum.sum()
IO.puts(result)
