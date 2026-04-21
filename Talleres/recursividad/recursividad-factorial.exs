defmodule Factorial do
  @moduledoc """
  Calcula el factorial de un número
  """

  def main do
    n =
      "Ingrese número a calcular su factorial: (entero positivo)"
      |> Util.ingresar_entero_mayor_que(-1)

    factorial = calcular_factorial(n)

    {n, factorial}
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  # Caso base
  defp calcular_factorial(n) when n < 2 do
    1
  end

  defp calcular_factorial(n) do
    calcular_factorial(n - 1) * n
  end

  defp generar_mensaje({n, factorial}) do
    "El factorial de #{n} es #{factorial}"
  end
end

Factorial.main()
