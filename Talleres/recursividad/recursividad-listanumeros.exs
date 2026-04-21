defmodule ListaNumeros do
  @moduledoc """
  Imprimir una lista de números de forma recursiva
  Ejemplo: [1,2,3,4,5]
  Salida: 1 2 3 4 5

  """
  def main do
    lista = [1,2,3,4,5]
    IO.inspect(lista)
    IO.puts("Imprime solo ida")
    imprimir_lista(lista)
    IO.puts("\n")
    IO.puts("Imprime ida y vuelta")
    imprimir_lista_ida_vuelta(lista)

    suma_numeros(lista)
  end

  defp imprimir_lista([]), do: nil

  defp imprimir_lista([h | t]) do
    IO.write("#{h} ")
    imprimir_lista(t)
  end
  # segunda forma recursiva en esta se aplica el proceso de ida y vuelta
  defp imprimir_lista_ida_vuelta([h | t]) do
    #Proceso de ida
    IO.write("#{h} ")
    imprimir_lista_ida_vuelta(t)
    #Proceso de vuelta
    IO.write("#{h} ")
  end

  defp imprimir_lista_ida_vuelta([]), do: nil

  
  defp suma_numeros(), do: nil

  defp suma_numeros(lista) do

  end

end
ListaNumeros.main()
