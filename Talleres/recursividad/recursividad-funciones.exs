defmodule RecursividadFunciones do
  def reverse ([]) do
    []
  end

  def reverse ([h|t]) do
    reverse(t) ++ [h]
  end

  def map([], _func) do
    []
  end
  def map([h | t], f) do
    [f.(h) | map(t, f)]
  end

  def suma_pares([]) do
    0
  end

  def suma_pares([h | t])do
    verificar_par(h) + suma_pares(t)
  end

  defp verificar_par(n)  do
    if rem(n, 2) == 0 do
      n
    else
      0
    end
  end

  def contar_num_lista([]) do
    0
  end

  def contar_num_lista([_ | t]) do
    1 + contar_num_lista(t)
  end

  def calcular_fibonacci(0) do
    0
  end
  def calcular_fibonacci(1) do
    1
  end
  def calcular_fibonacci(n) when n > 1 do
    calcular_fibonacci(n - 1) + calcular_fibonacci(n - 2)
  end

 

end

IO.inspect(RecursividadFunciones.reverse([1,2,3,4,5]))
IO.inspect(RecursividadFunciones.map([1,2,3,4,5], fn x -> x * 2 end))
IO.inspect(RecursividadFunciones.suma_pares([1,2,3,4,5,6]))
IO.inspect(RecursividadFunciones.contar_num_lista([1,2,3,4,5]))
IO.inspect(RecursividadFunciones.calcular_fibonacci(10))
IO.inspect(RecursividadFunciones.valor_minimo([5,3,8,1,4]))
