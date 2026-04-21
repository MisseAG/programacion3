defmodule SistemaDistribucion do
  @moduledoc """
  Sistema de distribucion de productos en cajas de distintos tamaños
  """
  def main()do
    mensaje = "Ingresar número de productos: "
    mensaje
    |> Util.ingresar(:entero)
    |> verificar_numero()
    |> calcular_combinacion_cajas()
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp verificar_numero(numero) when numero > 1000, do: {:error, "Cantidad no permitida"}
  defp verificar_numero(numero) when numero < 0, do: {:error, "Cantidad no permitida"}
  defp verificar_numero(numero) when rem(numero, 10) != 0, do: {:error, "Cantidad no permitida"}

  defp verificar_numero(numero) do
    {:ok, numero}
  end

  defp calcular_combinacion_cajas({:error, _} = error), do: error

  defp calcular_combinacion_cajas({:ok, numero}) do
    cajas_grandes = div(numero, 100)
    resto = rem(numero, 100)
    cajas_medianas = div(resto, 50)
    resto2 = rem(resto, 50)
    cajas_pequenas = div(resto2, 10)
    {:ok, {numero, cajas_grandes, cajas_medianas, cajas_pequenas}}
  end

  defp generar_mensaje({:error, mensaje}) do
    "Error: #{mensaje}"
  end

  defp generar_mensaje({:ok, {numero, cajas_grandes, cajas_medianas, cajas_pequenas}}) do
    "Para una cantidad de #{numero} productos, se usan #{cajas_pequenas} cajas pequeñas, #{cajas_medianas} cajas medianas, #{cajas_grandes} cajas grandes."
  end

end
SistemaDistribucion.main()
