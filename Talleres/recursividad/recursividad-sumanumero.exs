defmodule Suma do

  def main do
    n = 5
    sumar(n)
  end

  defp sumar(1) do
    1
  end

  defp sumar(n) do
    n + sumar(n - 1)
  end

  
end
