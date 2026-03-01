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

  @doc """
  Función para entrada
  """
  def ingresar(mensaje, parser, tipo_dato) do
    try do
        mensaje
        |> ingresar(:texto)
        |> parser.()
      rescue
        ArgumentError ->
        "Error, se espera que ingrese un número #{tipo_dato}\n"
        |> mostrar_error()
        mensaje
        |> ingresar(parser, tipo_dato)
    end
  end

  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)

  def ingresar(mensaje, :real), do: ingresar(mensaje, &String.to_float/1, :real)

  def ingresar(mensaje, :booleano) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.downcase()
    |> case do
        "s" -> true
        "n" -> false
        _ ->
          "Error, se espera que ingrese '1' o '2'\n"
          |> Util.mostrar_error()
          mensaje
          |> ingresar(:booleano)
      end
  end

  @doc """
  versión sin función de alto orden
  """
  # def ingresar(mensaje, :entero) do
  #   try do
  #     mensaje
  #     |> ingresar(:texto)
  #     |> String.to_integer()
  #   rescue
  #     ArgumentError ->
  #       "Error, se espera que ingrese un número entero\n"
  #       |> mostrar_error()

  #     mensaje
  #     |> ingresar(:entero)
  #   end
  # end

  # def ingresar(mensaje, :real) do
  #   try do
  #     mensaje
  #     |> ingresar(:texto)
  #     |> String.to_float()
  #   rescue
  #     ArgumentError ->
  #       "Error, se espera que ingrese un número real\n"
  #       |> mostrar_error()

  #       mensaje
  #       |> ingresar(:real)
  #   end
  # end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
