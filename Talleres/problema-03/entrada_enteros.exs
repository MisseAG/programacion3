defmodule EntradaEnteros do
  def main do
    valor_entregado = "Ingrese cantidad de dinero de pago: "
    |> Util.ingresar(:entero)

    valor_total = "Ingrese el valor total de la factura: "
    |> Util.ingresar(:entero)

    calcular_devuelta(valor_entregado, valor_total)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp calcular_devuelta(valor_entregado, valor_total) do
     valor_entregado - valor_total
  end

  defp generar_mensaje(devuelta) do
    "El valor de la devuelta es $#{devuelta}"
  end
end

EntradaEnteros.main()
