defmodule Cocinero do
  def iniciar do
    spawn(fn -> esperar_pedidos() end)
  end

  defp esperar_pedidos do
    receive do
      {:pedido, plato, cliente_pid} ->
        IO.puts("[spawn] Cocinando: #{plato} (PID: #{inspect(self())})")
        Process.sleep(2000) # simular tiempo de cocinar
        send(cliente_pid, {:listo, plato})
        esperar_pedidos() # tras terminar, vuelve a esperar
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
      send(pid_cocinero, {:pedido, plato, self()})

      receive do
        {:listo, plato_listo} -> IO.puts("Listo: #{plato_listo}")
      end
    end)
  end

  # Versión 2: PARALELO con spawn (un cocinero por pedido)

  def paralelo_spawn do
    IO.puts("\nPARALELO (spawn, un proceso por pedido):")
    padre = self()

    Enum.each(@pedidos, fn plato ->
      spawn(fn ->
        IO.puts("[spawn] Cocinando: #{plato} (PID: #{inspect(self())})")
        Process.sleep(2000)
        send(padre, {:listo, plato})
      end)
    end)

    recoger(length(@pedidos))
  end

  # Versión 3: PARALELO con Task.async

  def paralelo_task do
    IO.puts("\nPARALELO (Task.async):")

    @pedidos
    |> Enum.map(fn plato ->
      Task.async(fn ->
        IO.puts("[Task] Cocinando: #{plato} (PID: #{inspect(self())})")
        Process.sleep(2000)
        plato
      end)
    end)
    |> Task.await_many(10_000)
    |> Enum.each(fn plato ->
      IO.puts("Listo: #{plato}")
    end)
  end

  defp recoger(0), do: :ok
  defp recoger(n) do
    receive do
      {:listo, plato} ->
        IO.puts("Listo: #{plato}")
        recoger(n - 1)
    end
  end
end
