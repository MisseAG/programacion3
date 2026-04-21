defmodule ContarVocales do
  def main do
    "Ingrese la cadena a analizar: "
    |>Util.ingresar(:texto)
    |>String.trim()
    |>String.downcase()
    |>convertir_a_lista()
    |>contar_vocales()
    |>Util.mostrar_error()


  end


  #defp convertir_a_lista(texto) do
    # String.graphemes(texto)
  #end

  defp convertir_a_lista(txto) do
    txto
    |>String.split("", trim: true)
  end

  defp contar_vocales([]) do
    0
  end

  defp contar_vocales([h|t]) do
    if h in ["a", "e", "i", "o", "u"] do
      1 + contar_vocales(t)
    else
      contar_vocales(t)
    end
  end

end
ContarVocales.main()
