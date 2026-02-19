defmodule Util do
  @moduledoc """
  Módulo con Funciones que se reutilizan
  - Autor: Augusto
  - Fecha: Febrero 2026
  - Licencia: GNU GPL v3
  """
  def mostrar_mensaje_java(mensaje) do
    System.cmd("java",["-cp", ".", "Mensaje", mensaje])
  end

  @doc """
    Función para mostrar mensaje en pantalla
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |>IO.puts()
  end

  @doc """
  Función para entrada de cadenas
  """
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
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

  defp ingresar(mensaje, parser, tipo_dato) do
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

    def ingresar(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)
    def ingresar(mensaje, :real), do: ingresar(mensaje, &String.to_float/1, :real)


  @doc """
  Función entrada de cadena con GUI
  """
  def ingresar_java(mensaje,:texto) do
  # Llama al programa Java para ingresar texto y capturar la entrada
  case System.cmd("java", ["-cp", ".", "MensajeEntrada","input", mensaje]) do
    {output, 0} ->
      IO.puts("Texto ingresado correctamente.")
      IO.puts("Entrada: #{output}")
      String.trim(output) # Retorna la entrada sin espacios extra
    {error, code} ->
      IO.puts("Error al ingresar el texto. Código: #{code}")
      IO.puts("Detalles: #{error}")
      nil
    end
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
