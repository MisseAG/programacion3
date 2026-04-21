defmodule Matrushka do
  def main do

    Util.ingresar("Ingrese cantidad de matrushkas: ", :entero)
    |> imprimir_matrushka()
    # abrir_matrushkas(cantidad_matrushkas)
    # cerrar_matrushkas(cantidad_matrushkas)

  end


  # defp abrir_matrushkas(cantidad_matrushkas)  when cantidad_matrushkas > 1 do
  #   IO.puts("Abriendo Matrushka: #{cantidad_matrushkas}")
  #   cantidad_matrushkas = cantidad_matrushkas - 1
  #   abrir_matrushkas(cantidad_matrushkas)
  # end

  # defp cerrar_matrushkas(cantidad_matrushkas) when cantidad_matrushkas > 1 do
  #   IO.puts("Cerrando Matrushka: #{cantidad_matrushkas}")
  #   cantidad_matrushkas = cantidad_matrushkas + 1 #no es así. se devuelve al estado anterior, no se suma 1
  #   cerrar_matrushkas(cantidad_matrushkas)
  # end

  # defp cerrar_matrushkas(cantidad_matrushkas) when cantidad_matrushkas > 1 do
  #   IO.puts("Cerrando Matrushka: #{cantidad_matrushkas}")
  #   cantidad_matrushkas = cantidad_matrushkas + 1 #no es así. se devuelve al estado anterior, no se suma 1
  #   cerrar_matrushkas(cantidad_matrushkas)
  # end

  #Caso Base
  # defp abrir_matrushkas(1), do: nil
  # defp cerrar_matrushkas(1), do: nil



  # defp imprimir_matrushka(M) do
  #   #Proceso de ida
  #   for i <- M..1 do
  #     IO.puts("Abriendo Matrushka: #{i}")
  #   end
  #   #Proceso de vuelta
  #   for i <- 1..M do
  #     IO.puts("Cerrando Matrushka: #{i}")
  #   end
  # end

  #caso recursivo
  defp imprimir_matrushka(n) when n > 1 do
    IO.puts("Abriendo matrushka: #{n}")
    imprimir_matrushka(n-1)
    IO.puts("Cerrando matrushka: #{n}")
  end

  # caso base
  defp imprimir_matrushka(1) do
    IO.puts("Abriendo Matrushka: 1")
    IO.puts("Cerrando Matrushka: 1")
  end
end

Matrushka.main()
