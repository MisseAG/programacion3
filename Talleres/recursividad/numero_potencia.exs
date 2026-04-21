defmodule NumeroPotencia do
  def main do
    n =
      "Ingrese entero n: "
      |> Util.ingresar(:entero)

    b =
      "Ingrese entero b: "
      |> Util.ingresar(:entero)

    IO.puts(numero_es_potencia(n, b))
  end

  def numero_es_potencia(n, b) do
    es_potencia(n, b)
  end

  # casos base
  # Todo número es potencia 0 de b si llega a 1
  defp es_potencia(1, _b), do: true

  # Casos inválidos
  defp es_potencia(n, b) when n < 1 or b <= 1, do: false


  defp es_potencia(n, b) do
    if rem(n, b) == 0 do
      es_potencia(div(n, b), b)
    else
      false
    end
  end
end

NumeroPotencia.main()
  