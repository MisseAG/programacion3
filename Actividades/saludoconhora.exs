defmodule SaludoConHora do
@moduledoc """
SaludoConHora: Programa que saluda al usuario dependiendo de la hora del sistema
"""
def main do
  mensaje = "Ingrese su nombre: "
  nombre = Util.ingresar(mensaje, :texto)
  hora_actual = obtener_hora()
  saludo = generar_saludo(nombre, hora_actual)
  Util.mostrar_mensaje(saludo)
end

defp generar_saludo(nombre, hora) do
  hora_actual = elem(hora, 0) #obtiene la hora sin minutos y segundos
  saludo = determinar_saludo_hora(hora_actual)
  "#{saludo}, #{nombre}"
end

defp determinar_saludo_hora(hora) do
  case hora do
    hora when hora < 12 -> "Buenos días"
    hora when hora < 18 -> "Buenas tardes"
    _ -> "Buenas noches"
  end
end

defp obtener_hora do
  :calendar.local_time()
  |> elem(1) #obtiene la tupla de hora
end
end

SaludoConHora.main()
