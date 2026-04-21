vuelos = [
  %{
    codigo: "AV201",
    aerolinea: "Avianca",
    origen: "BOG",
    destino: "MDE",
    duracion: 45,
    precio: 180_000,
    pasajeros: 120,
    disponible: true
  },
  %{
    codigo: "LA305",
    aerolinea: "Latam",
    origen: "BOG",
    destino: "CLO",
    duracion: 55,
    precio: 210_000,
    pasajeros: 98,
    disponible: true
  },
  %{
    codigo: "AV410",
    aerolinea: "Avianca",
    origen: "MDE",
    destino: "CTG",
    duracion: 75,
    precio: 320_000,
    pasajeros: 134,
    disponible: false
  },
  %{
    codigo: "VV102",
    aerolinea: "Viva Air",
    origen: "BOG",
    destino: "BAQ",
    duracion: 90,
    precio: 145_000,
    pasajeros: 180,
    disponible: true
  },
  %{
    codigo: "LA512",
    aerolinea: "Latam",
    origen: "CLO",
    destino: "CTG",
    duracion: 110,
    precio: 480_000,
    pasajeros: 76,
    disponible: false
  },
  %{
    codigo: "AV330",
    aerolinea: "Avianca",
    origen: "BOG",
    destino: "CTG",
    duracion: 135,
    precio: 520_000,
    pasajeros: 155,
    disponible: true
  },
  %{
    codigo: "VV215",
    aerolinea: "Viva Air",
    origen: "MDE",
    destino: "BOG",
    duracion: 50,
    precio: 130_000,
    pasajeros: 190,
    disponible: true
  },
  %{
    codigo: "LA620",
    aerolinea: "Latam",
    origen: "BOG",
    destino: "MDE",
    duracion: 145,
    precio: 390_000,
    pasajeros: 112,
    disponible: true
  },
  %{
    codigo: "AV505",
    aerolinea: "Avianca",
    origen: "CTG",
    destino: "BOG",
    duracion: 120,
    precio: 440_000,
    pasajeros: 143,
    disponible: false
  },
  %{
    codigo: "VV340",
    aerolinea: "Viva Air",
    origen: "BAQ",
    destino: "BOG",
    duracion: 85,
    precio: 160_000,
    pasajeros: 175,
    disponible: true
  }
]

defmodule Aerolinea do
  # Filtra los vuelos disponibles y retorna solo sus códigos, ordenados alfabéticamente.
  def filtrar_vuelos_disponibles(vuelos) do
    vuelos
    |> Enum.filter(fn vuelo -> vuelo.disponible end)
    |> Enum.map(fn vuelo -> vuelo.codigo end)
    |> Enum.sort()
  end

  def agrupar_sumar(vuelos)do
    vuelos
    |>Enum.group_by(fn vuelo -> vuelo.aerolinea end)
    |> Enum.map(fn {aerolinea, lista_vuelos} ->
        suma = Enum.sum(Enum.map(lista_vuelos, & &1.pasajeros))
        {aerolinea, suma}
      end)
  end

  def cadena(vuelos) do
    vuelos
    |> Enum.map(fn %{codigo: codigo, origen: origen, destino: destino, duracion: duracion} ->
      horas = div(duracion, 60)
      minutos = rem(duracion, 60)

      minutos_modificados =
        if minutos < 10 do
          "0#{minutos}"
        else
          "#{minutos}"
        end

      "#{codigo} - #{origen} -> #{destino}: #{horas}h #{minutos_modificados}m"
    end)
  end

  def filtrar_vuelos_precio_menor(vuelos, valor) do
  vuelos
  |> Enum.filter(fn vuelo -> vuelo.precio < valor end)
  |> Enum.map(fn vuelo ->
    precio_final = vuelo.precio * 0.90
    {vuelo.codigo, "#{vuelo.origen} - #{vuelo.destino}", precio_final}
  end)
  |> Enum.sort_by(fn {_, _, precio} -> precio end)
  end

  def aerolineas_completas(vuelos) do
  vuelos
  |> Enum.group_by(fn vuelo -> vuelo.aerolinea end)
  |> Enum.filter(fn {_aerolinea, lista_vuelos} ->

    categorias =
      lista_vuelos
      |> Enum.map(fn vuelo ->
        cond do
          vuelo.duracion < 60 -> :corto
          vuelo.duracion <= 120 -> :medio
          true -> :largo
        end
      end)

    Enum.member?(categorias, :corto) and
    Enum.member?(categorias, :medio) and
    Enum.member?(categorias, :largo)
  end)
  |> Enum.map(fn {aerolinea, _} -> aerolinea end)
end

end

IO.puts("Filtrar vuelos disponibles")
IO.inspect(Aerolinea.filtrar_vuelos_disponibles(vuelos))
IO.puts("Agrupa por aerolíena y suma pasajeros")
IO.inspect(Aerolinea.agrupar_sumar(vuelos))
IO.puts("Cadena de vuelos")
IO.inspect(Aerolinea.cadena(vuelos))
IO.puts("Filtrar vuelos por precio menor a 440.000")
IO.inspect(Aerolinea.filtrar_vuelos_precio_menor(vuelos, 440_000))
Io.puts("Aerolineas con vuelos cortos, medios y largos")
IO.inspect(Aerolinea.aerolineas_completas(vuelos))

