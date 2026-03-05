defmodule ReservasHotel do
  def main() do
    numero_noches = Util.ingresar("Ingrese numero de noches: ", :entero)
    tipo_cliente = ingresar_tipo_cliente()
    temporada = Util.ingresar("Ingrese temporada(1: Alta, 2: Baja): ",:booleano) #true para alta, false para baja

    numero_noches
    |> calcular_subtotal()
    |> aplicar_descuento_recargo(tipo_cliente, temporada)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  #Calcular el subtotal sin descuentos ni recargos, guardas
  defp calcular_subtotal(numero_noches) when numero_noches <= 2, do: numero_noches * 120000
  defp calcular_subtotal(numero_noches) when numero_noches <= 5, do: numero_noches * 100000
  defp calcular_subtotal(numero_noches) when numero_noches > 5, do: numero_noches * 85000

  #Función que aplica descuento y recargo a la tarifa base
  defp aplicar_descuento_recargo(subtotal, tipo_cliente, temporada) do

    valor_descuento = aplicar_descuento_tipo_cliente(subtotal, tipo_cliente)
    valor_recargo = aplicar_recargo_temporada(subtotal, temporada)

    total_final =
      subtotal
      |>aplicar_descuento_tipo_cliente(tipo_cliente)
      |>aplicar_recargo_temporada(temporada)

    {
      subtotal,                # Tarifa base por noche
      valor_descuento,         # Valor del descuento
      valor_recargo,           # Valor del recargo
      total_final              # Total a pagar
    }
  end

  #Pattern Matching para descuento
  defp aplicar_descuento_tipo_cliente(subtotal, :frecuente), do: subtotal * 0.8 #20% descuento
  defp aplicar_descuento_tipo_cliente(subtotal, :corporativo), do: subtotal * 0.85 #15% descuento
  defp aplicar_descuento_tipo_cliente(subtotal, :ocasional), do: subtotal #sin descuento

  #Recargo con cond
  defp aplicar_recargo_temporada(subtotal, temporada) do
    cond do
      temporada == true -> subtotal * 1.25
      temporada == false -> subtotal
    end
  end

  defp generar_mensaje({subtotal, valor_descuento, valor_recargo, total_final}) do
    tarifa_por_noche = subtotal / numero_noches(subtotal)

    mensaje = """
    Tarifa base por noche: $#{tarifa_por_noche}
    Subtotal sin descuentos ni recargos: $#{subtotal}
    Valor del descuento: $#{valor_descuento}
    Valor del recargo: $#{valor_recargo}
    Total a pagar: $#{total_final}
    """

    mensaje
  end

   # Función para obtener número de noches del subtotal
  defp numero_noches(subtotal) do
    cond do
      subtotal <= 240000 ->
        div(subtotal, 120000)

      subtotal <= 500000 ->
        div(subtotal, 100000)

      true ->
        div(subtotal, 85000)
    end
end

  defp ingresar_tipo_cliente() do
    Util.mostrar_mensaje("Seleccione tipo de cliente:")
    Util.mostrar_mensaje("1. Frecuente")
    Util.mostrar_mensaje("2. Corporativo")
    Util.mostrar_mensaje("3. Ocasional")
    opcion = Util.ingresar("Ingrese la opción: " ,:entero)
    case opcion do
      1 -> :frecuente
      2 -> :corporativo
      3 -> :ocasional
      _ ->
        Util.mostrar_mensaje("Opción inválida. Intente nuevamente.")
        ingresar_tipo_cliente()
    end
  end
end
ReservasHotel.main()
