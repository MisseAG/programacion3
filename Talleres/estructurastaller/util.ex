defmodule Util do

  @moduledoc """
  Módulo con Funciones que se reutilizan
  - Autor: Augusto
  - Fecha: Febrero 2026
  - Licencia: GNU GPL v3
  """
  @doc """
    Función para mostrar mensaje en pantalla
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |>IO.puts()
  end

  def mostrar_lista(lista) do
    lista
    |>IO.inspect()
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue

      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error()
        mensaje
        |> ingresar(:entero)
    end
  end

  def ingresar_entero_mayor_que(mensaje, valor_minimo) do
    n = ingresar(mensaje, :entero)
    cond do
      n > valor_minimo ->
        n
      true ->
        ingresar_entero_mayor_que(
          "El valor no es mayor que #{valor_minimo}. Intente nuevamente:\n", valor_minimo)
    end
  end

  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número real\n"
        |> mostrar_error()
        mensaje
        |> ingresar(:real)
    end
  end

  def ingresar(mensaje, :booleano) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.downcase()
    |> case do
        "1" -> true
        "si" -> true
        "2" -> false
        "no" -> false
        _ ->
          "Error, se espera que ingrese '1' o '2', 'si' o 'no'\n"
          |> Util.mostrar_error()
          mensaje
          |> ingresar(:booleano)
      end
  end

  #caso especial de boolean para que compile cliente.ex. NO confundir con :booleano
  def ingresar(mensaje, :boolean) do
    valor =
      mensaje
      |> ingresar(:texto)
      |> String.downcase()

    Enum.member?(["sí", "si", "s"], valor)
  end
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
