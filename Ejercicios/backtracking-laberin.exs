defmodule Laberinto do
  defstruct laberinto: [
    [?#, ?#, ?#, ?#, ?#, ?#, ?#, ?#, ?#, ?#],
    [?#, ?\s , ?#, ?\s , ?\s , ?\s , ?\s , ?\s , ?\s , ?#],
    [?#, ?\s , ?#, ?\s , ?#, ?#, ?#, ?#, ?#, ?#],
    [?#, ?\s , ?\s , ?\s , ?#, ?\s , ?\s , ?\s , ?\s , ?#],
    [?#, ?#, ?#, ?\s , ?\s , ?\s , ?#, ?#, ?#, ?#],
    [?#, ?\s , ?\s , ?\s , ?#, ?\s , ?\s , ?\s , ?\s , ?#],
    [?#, ?#, ?#, ?#, ?#, ?\s , ?#, ?#, ?#, ?#],
    [?#, ?\s , ?\s , ?\s , ?#, ?\s , ?#, ?\s , ?#, ?#],
    [?#, ?\s , ?#, ?\s , ?\s , ?\s , ?\s , ?\s , ?\s , ?#],
    [?#, ?#, ?#, ?#, ?#, ?#, ?#, ?#, ?#, ?#]
  ]

  def main do
    lab = %Laberinto{}
    fila_1 = Enum.at(lab.laberinto, 1)
    nueva_fila_1 = List.replace_at(fila_1, 1, ?X)
    lab = put_in(lab.laberinto, List.replace_at(lab.laberinto, 1, nueva_fila_1))

    rutas = encontrar_todas(lab.laberinto, 8, 1, [], [])
    IO.puts("Se encontraron #{length(rutas)} soluciones:\n")

    Enum.with_index(rutas, 1)
    |> Enum.each(fn {ruta, i} ->
      IO.puts("Ruta ##{i}: #{inspect(Enum.reverse(ruta))}")
    end)
  end

  def encontrar_todas(lab, x, y, camino, rutas_acumuladas) do
    case get_cell(lab, x, y) do
      ?X ->
        [[{x, y} | camino] | rutas_acumuladas]

      c when c in [?#, ?*, ?f] ->
        rutas_acumuladas

      _ ->
        lab = update_cell(lab, x, y, ?*)
        direcciones = [{0, 1}, {-1, 0}, {0, -1}, {1, 0}]

        Enum.reduce(direcciones, rutas_acumuladas, fn {dx, dy}, rutas ->
          encontrar_todas(lab, x + dx, y + dy, [{x, y} | camino], rutas)
        end)
    end
  end

  defp get_cell(lab, x, y) do
    if x in 0..(length(lab) - 1) and y in 0..(length(Enum.at(lab, x)) - 1) do
      lab |> Enum.at(x) |> Enum.at(y)
    else
      ?#  # fuera del laberinto = pared
    end
  end

  defp update_cell(lab, x, y, value) do
    fila = Enum.at(lab, x)
    nueva_fila = List.replace_at(fila, y, value)
    List.replace_at(lab, x, nueva_fila)
  end
end

Laberinto.main()
