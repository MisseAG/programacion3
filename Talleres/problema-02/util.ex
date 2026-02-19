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
end
