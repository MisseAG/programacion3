defmodule EntradaDatos do
  @moduledoc """
  Módulo de Programa que genera mensaje dado un nombre.
  """
    def main do
      "Ingrese el nombre del empleado: "
        |> Util.ingresar_java(:texto)
        |> generar_mensaje()
        |> Util.mostrar_mensaje_java()
    end

    defp generar_mensaje(nombre) do
      "Bienvenido #{nombre}, a la empresa Once Ltda"
    end
end

EntradaDatos.main()
