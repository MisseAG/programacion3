defmodule ValidacionAcceso do
  @moduledoc """
  Pensamiento Computacional
  Abstracción: Programa que gestiona el proceso de validación de acceso
  Información relevante:
  - El nombre del usuario.
  - La edad del usuario.
  - Un indicador que determine si posee credenciales válidas (valor lógico).
  - El número de intentos fallidos registrados previamente.

  Descomposición:
  - Ingresar el nombre de usuario
  - Ingresar la edad
  - Ingresar credenciales.
  - Evaluar si tiene credenciales válidas.
  - Evaluar mayor de edad.
  - Evaluar número de intentos menor a 3.
  - Mostrar mensaje.

  Reconocimiento de Patrones:
  - ingresar
  - mostrar_mensaje
  """
  def main do
    "Ingrese el nombre de usuario: "
    |> Util.ingresar(:texto)
    edad_usuario = "Ingrese la edad: "
    |> Util.ingresar(:entero)
    credenciales = "Ingrese las credenciales: (s/n)"
    |> ingresar_booleano()

    numero_intentos = 0

    evaluar_validez(edad_usuario, credenciales, numero_intentos)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp ingresar_booleano(mensaje) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.downcase()
    |> case do
        "s" -> true
        "n" -> false
        _ ->
          "Error, se espera que ingrese 's' o 'n'\n"
          |> Util.mostrar_error()
          mensaje
          |> ingresar_booleano()
      end
  end

  defp evaluar_validez(edad_usuario, credenciales, numero_intentos) do
    {
      evaluar_mayor_edad(edad_usuario),
      evaluar_credenciales(credenciales),
      evaluar_numero_intentos(numero_intentos)
    }
  end

  defp evaluar_mayor_edad(edad_usuario) do
    if edad_usuario >= 18 do
      :ok
    else
      {:error, "restricción de edad"}
    end
  end

  defp evaluar_credenciales(credenciales) do
    if credenciales do
      :ok
    else
      {:error, "credenciales inválidas"}
    end
  end

  defp evaluar_numero_intentos(intentos) do
    if intentos >= 3 do
      {:error, "número de intentos máximo, cuenta bloqueada"}
    else
      :ok
    end
  end

  defp generar_mensaje({resultado_edad, resultado_credenciales, resultado_intentos}) do
    case {resultado_edad, resultado_credenciales, resultado_intentos} do
    {:ok, :ok, :ok} ->
      "Acceso Concedido"

    {{:error, _}, _, _} ->
      "Acceso Denegado - Restricción de edad"

    {_, {:error, _}, _} ->
      "Acceso Denegado - Credenciales inválidas"

    {_, _, {:error, _}} ->
      "Acceso Denegado - Cuenta bloqueada por múltiples intentos fallidos"
   end
  end
end

ValidacionAcceso.main()
