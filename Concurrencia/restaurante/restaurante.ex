#Proceso Cocinero
defmodule Cocinero do
  def iniciar do
    spawn(fn -> esperar_pedidos() end) #crea nuevo proceso ligero que ejecuta esperar_pe
  end

  defp esperar_pedidos do
    receive do # proceso que espera recibir algo
      {:pedido, plato, cliente_pid} -> #nombre del plato y quien pide
        IO.puts("[spawn] Cocinando: #{plato} (PID: #{inspect(self())})")
        Process.sleep(2000) # simular tiempo de cocinar
        send(cliente_pid, {:listo, plato}) #envía mensaje a cliente
        esperar_pedidos() # tras terminar, vuelve a esperar recursión cola
    end
  end
end

defmodule Restaurante do
  @pedidos ["Hamburguesa", "Pizza", "Ensalada", "Sopa", "Pasta"]

  # Versión 1: SECUENCIAL con spawn (un cocinero solo)

  def secuencial do
    IO.puts("\nSECUENCIAL (spawn, un cocinero):")
    pid_cocinero = Cocinero.iniciar()

    Enum.each(@pedidos, fn plato ->
      send(pid_cocinero, {:pedido, plato, self()}) #self es cliente_pid

      receive do # espera :listo del proceso cocinero
        {:listo, plato_listo} -> IO.puts("Listo: #{plato_listo}")
      end
    end)
  end

  # Versión 2: PARALELO con spawn (un cocinero por pedido)

  def paralelo_spawn do
    IO.puts("\nPARALELO (spawn, un proceso por pedido):")
    padre = self() #proceso restaurante con pid

    Enum.each(@pedidos, fn plato ->
      spawn(fn ->
        IO.puts("[spawn] Cocinando: #{plato} (PID: #{inspect(self())})")
        Process.sleep(2000)
        send(padre, {:listo, plato}) #cocinero envía a proceso restaurante
      end)
    end)

    recoger(length(@pedidos))
  end

  #recoger/1 para paralelo_spawn
  defp recoger(0), do: :ok
  defp recoger(n) do
    receive do
      {:listo, plato} ->
        IO.puts("Listo: #{plato}")
        recoger(n - 1)
    end
  end
end
