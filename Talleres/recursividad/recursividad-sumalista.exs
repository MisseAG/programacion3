defmodule SumaListaNumeros do
  @moduledoc """
  Sumar una lista de números de forma recursiva
  Ejemplo: [1,2,3,4,5,6,7,8,9,10]
  Salida: 18

  """
  def main do
    lista = [4,5,6,2,1]
    IO.puts("Lista: \n")
    IO.inspect(lista)

    IO.puts("Imprime la suma: \n")
    IO.inspect(suma_numeros(lista))

  end

  defp suma_numeros(lista) when length(lista) == 1 do
    # caso base
    hd(lista)
  end

  defp suma_numeros(lista) do
    IO.puts("Entrando a suma_numeros con: #{inspect(lista)}")
    {i,d} = dividir(lista)

    # proceso de ida
    suma_i = suma_numeros(i)
    suma_d = suma_numeros(d)

    IO.puts("Saliendo de suma_numeros con: #{inspect(lista)}")

    suma_i + suma_d


  end

  defp dividir(lista) do
    len = length(lista)
    mitad = div(len, 2)
    Enum.split(lista, mitad)
  end
end
ListaNumeros.main()
