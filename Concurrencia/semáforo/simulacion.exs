defmodule BanoPublico do
  def iniciar(cubiculos) do
    spawn(fn -> loop(cubiculos, []) end)
  end

  defp loop(cubiculos_disponibles, cola_espera) do
    receive do
      {:entrar, persona, pid} ->
        if cubiculos_disponibles > 0 do
          IO.puts("🟢 #{persona} entra al baño (libres: #{cubiculos_disponibles - 1})")
          send(pid, :puede_entrar)
          loop(cubiculos_disponibles - 1, cola_espera)
        else
          IO.puts("🟡 #{persona} está esperando...")
          loop(cubiculos_disponibles, cola_espera ++ [{persona, pid}])
        end

      {:salir, persona} ->
        IO.puts("🔴 #{persona} salió del baño")

        case cola_espera do
          [] ->
            IO.puts("⚪ Cubículo libre (libres: #{cubiculos_disponibles + 1})")
            loop(cubiculos_disponibles + 1, [])

          [{sig_persona, sig_pid} | resto] ->
            IO.puts("🟢 #{sig_persona} entra desde la cola")
            send(sig_pid, :puede_entrar)
            loop(cubiculos_disponibles, resto)
        end
    end
  end
end

defmodule Persona do
  def iniciar(nombre, bano) do
    Task.start(fn -> usar_bano(nombre, bano) end)
  end

  defp usar_bano(nombre, bano) do
    send(bano, {:entrar, nombre, self()})

    receive do
      :puede_entrar ->
        :timer.sleep(:rand.uniform(2000))
        send(bano, {:salir, nombre})
    end
  end
end

defmodule Simulacion do
  def main do
    bano = BanoPublico.iniciar(2)

    personas = ["Ana", "Luis", "Carlos", "Marta", "Sofia"]

    Enum.each(personas, fn nombre ->
      Persona.iniciar(nombre, bano)
      :timer.sleep(200)
    end)
    :timer.sleep(5000)
  end
end

Simulacion.main()
