defmodule SistemaParqueadero do
  @moduledoc """
  Módulo para el sistema de parqueadero
  - Autor: Augusto
  - Fecha: Febrero 2026
  - Licencia: GNU GPL v3
  """
  def main do
    horas = Util.ingresar("Ingrese horas de permanencia: ",:entero)
    es_cliente_frecuente = Util.ingresar("¿Es el cliente frecuente? (s/n)",:booleano)
    es_vehiculo_electrico = Util.ingresar("¿Es el vehículo eléctrico? (s/n)",:booleano)
    es_finde = Util.ingresar("¿Es fin de semana? (s/n)",:booleano)

    horas
    |> calcular_tarifa()
    |> aplicar_descuentos(es_cliente_frecuente, es_vehiculo_electrico, es_finde) #retorna tupla con tarifa y tarifa con dcto
    |> generar_factura()
    |> Util.mostrar_mensaje
  end

  defp calcular_tarifa(horas) when horas <= 2, do: 3000 #primeras dos horas 3000
  defp calcular_tarifa(horas) when horas <= 5, do: 3000+2500*(horas-2) #2500 cada una horas adicionales entre 3 y 5
  defp calcular_tarifa(horas) when horas <= 8, do: 3000+2000*(horas-2)
  defp calcular_tarifa(horas) when horas > 8, do: 18000 #tarifa fija de 18000

  defp aplicar_descuentos(tarifa, es_cliente_frecuente, es_vehiculo_electrico, es_finde) do
    tarifa_con_descuento = tarifa
    |> aplicar_descuento_cliente(es_cliente_frecuente)
    |> aplicar_descuento_vehiculo(es_vehiculo_electrico)
    |> aplicar_descuento_fin_semana(es_finde)

    {tarifa, tarifa_con_descuento}
  end

  defp aplicar_descuento_cliente(tarifa, true), do: tarifa * 0.85  # 15% descuento
  defp aplicar_descuento_cliente(tarifa, false), do: tarifa

  defp aplicar_descuento_vehiculo(tarifa, true), do: tarifa * 0.8  # 20% descuento
  defp aplicar_descuento_vehiculo(tarifa, false), do: tarifa

  defp aplicar_descuento_fin_semana(tarifa, true), do: tarifa * 0.9  # 10% descuento
  defp aplicar_descuento_fin_semana(tarifa, false), do: tarifa


  defp generar_factura({tarifa, tarifa_con_descuento}) do
    "Tarifa base: #{tarifa}\n"
    "Tarifa con descuentos aplicados: #{tarifa_con_descuento}\n"
  end

end
SistemaParqueadero.main()
