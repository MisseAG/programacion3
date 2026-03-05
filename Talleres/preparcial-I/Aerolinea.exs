defmodule Aerolinea do
  def main() do
    Util.mostrar_mensaje(
      "Destinos disponibles: Bogotá, Medellín, Cartagena, San Andrés"
      )

    destino = ingresar_destino("Ingrese el destino: ")
    cargos = obtener_cargos(destino)
    destino
    |> calcular_total(cargos)
    |> generar_mensaje(destino)
    |> Util.mostrar_mensaje()
  end

  defp ingresar_destino(mensaje) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.downcase()
    |> String.trim()
    |> case do
        "bogotá" -> :bogota
        "medellín" -> :medellin
        "cartagena" -> :cartagena
        "san andrés" -> :san_andres
        _ ->
          Util.mostrar_error("Error, destino no válido. Por favor ingrese un destino válido.\n")
          ingresar_destino(mensaje)
      end
  end

  defp obtener_cargos(destino)
       when destino in [:bogota, :medellin, :cartagena] do
    Util.mostrar_mensaje("Cargos adicionales: \n")
    silla =
      Util.ingresar("¿Desea selección de silla? ", :booleano)
    seguro =
      Util.ingresar("¿Desea seguro de viaje? ", :booleano)
    maleta =
      Util.ingresar("¿Desea agregar maleta adicional? ", :booleano)
    [silla, maleta, seguro]
  end


  defp obtener_cargos(:san_andres) do
    Util.mostrar_mensaje("Cargos adicionales: ")

    silla =
      Util.ingresar("¿Desea selección de silla? ", :booleano)

    seguro =
      Util.ingresar("¿Desea seguro de viaje? ", :booleano)

    # maleta obligatoria
    maleta = true
    [silla, maleta, seguro]
    end

  defp calcular_total(destino, cargos) do
    precio_base = calcular_destino(destino)
    precio_cargos = calcular_cargos_adicionales(cargos)

    precio_base + precio_cargos
  end

  defp calcular_destino(:bogota), do: 200000
  defp calcular_destino(:medellin), do: 250000
  defp calcular_destino(:cartagena), do: 300000
  defp calcular_destino(:san_andres), do: 350000

  defp calcular_cargos_adicionales([silla, maleta, seguro]) do
    cargo_silla = if silla, do: 15000, else: 0
    cargo_maleta = if maleta, do: 45000, else: 0
    cargo_seguro = if seguro, do: 12000, else: 0

    cargo_silla + cargo_maleta + cargo_seguro
  end

  defp generar_mensaje(total, :san_andres) do
    "El total a pagar por el vuelo a San Andrés es: $#{total},
    incluyendo el cargo obligatorio por maleta adicional ($12000)."
  end

  defp generar_mensaje(total, destino) do
    "El total a pagar por el vuelo a #{destino} es: $#{total}."
  end

end
Aerolinea.main()
