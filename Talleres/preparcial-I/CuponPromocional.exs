defmodule CuponPromocional do
  def main do
    "Ingrese el código del cupón: "
    |> Util.ingresar(:texto)
    |> validar_codigo()
    |> generar_resultado()
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end


  defp validar_codigo(codigo) do
    []
    |> validar_letra_mayus(codigo)
    |> validar_longitud(codigo)
    |> validar_numero(codigo)
    |> validar_sin_espacios(codigo)
  end

  defp validar_letra_mayus(errores, codigo) do
    if String.match?(codigo, ~r/[A-Z]/) do
      errores
    else
      ["Debe contener al menos una letra mayúscula" | errores]
    end
  end

  defp validar_longitud(errores, codigo) do
    if String.length(codigo) >= 10 do
      errores
    else
      ["Debe tener al menos 10 caracteres" | errores]
    end
  end

  defp validar_numero(errores, codigo) do
    if String.match?(codigo, ~r/[0-9]/) do
      errores
    else
      ["Debe contener al menos un número" | errores]
    end
  end

  defp validar_sin_espacios(errores, codigo) do
    if String.contains?(codigo, " ") do
      ["No debe contener espacios" | errores]
    else
      errores
    end
  end

  defp generar_resultado([]) do
    {:ok, "Cupón válido"}
  end

  defp generar_resultado(errores) do
    mensaje = Enum.join(errores, " , ")
    {:error, mensaje}
  end

  defp generar_mensaje({:ok, mensaje}) do
  mensaje
  end

  defp generar_mensaje({:error, mensaje}) do
    "Error: " <> mensaje
  end
end

CuponPromocional.main()
