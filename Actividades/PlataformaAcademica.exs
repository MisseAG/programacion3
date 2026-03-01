defmodule ValidarNombreUsuario do
  @moduledoc """
  Validar nombre de usuario
  """
  def main() do
    "Ingrese nombre de usuario: "
    |> Util.ingresar(:texto)
    |> validar_usuario()
    |> generar_resultado()
    |> Util.mostrar_mensaje()
  end


  #Función retorna una tupla con los resultados de cada validación

  defp validar_usuario(nombre) do
    nombre
    |> realizar_validaciones()
    |> consolidar_validaciones()
  end

  #Función que realiza las validaciones

  defp realizar_validaciones(nombre)do
    {
      validar_longitud(nombre),
      validar_minusculas(nombre),
      validar_sin_espacios(nombre),
      validar_sin_especiales(nombre),
      validar_contiene_letra(nombre)
    }
  end


  #Retorna una tupla con una lista con los errores o vacía si pasa todas las validaciones

  defp consolidar_validaciones(validaciones) do
    errores = validaciones
              |> Tuple.to_list()
              |> Enum.filter(&(&1 != :ok)) #filtra las validaciones

    if Enum.empty?(errores) do
      {:ok, []}
    else
      {:error, errores}
    end
  end


  #lo convierte en mensaje

  defp generar_resultado({:ok, []}) do
    "Usuario válido"
  end

  defp generar_resultado({:error, errores}) do
    lista_errores = Enum.map_join(errores, "\n", &"• #{&1}")
    "El nombre no es válido:\n#{lista_errores}"
  end

  defp validar_longitud(nombre) do
    case String.length(nombre) do
      longitud when longitud in 5..12 -> :ok
      _ -> "Debe tener entre 5 y 12 caracteres"
    end
  end

   defp validar_minusculas(nombre) do
    if nombre == String.downcase(nombre), do: :ok, else: "Debe estar completamente en minúsculas"
  end

  defp validar_sin_espacios(nombre) do
    if String.contains?(nombre, " "), do: "No debe contener espacios", else: :ok
  end

  defp validar_sin_especiales(nombre) do
    especiales = ~r/[@#$%&*!?¡¿.,=)("+-\/]/
    if String.match?(nombre, especiales), do: "No debe contener caracteres especiales", else: :ok
  end

   defp validar_contiene_letra(nombre) do
    if String.match?(nombre, ~r/[a-zA-Z]/), do: :ok, else: "Debe contener al menos una letra"
  end

end

ValidarNombreUsuario.main()
