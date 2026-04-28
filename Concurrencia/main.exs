## Cargar módulos
Code.require_file("benchmark.ex")
Code.require_file("restaurante.ex")

# Configuración de pedidos y duración
num_pedidos = 5
duracion_pedido = 2

IO.puts("""
╔══════════════════════════════════════════════════╗
║   RESTAURANTE CONCURRENTE — Benchmark Elixir     ║
║   #{num_pedidos} pedidos × #{duracion_pedido} segundos cada uno               ║
╚══════════════════════════════════════════════════╝
""")

# ── 1. SECUENCIAL ────────────────────────────────
tiempo_sec = Benchmark.determinar_tiempo_ejecucion(
  {Restaurante, :secuencial, []}
)

# ── 2. PARALELO CON SPAWN ────────────────────────
tiempo_spawn = Benchmark.determinar_tiempo_ejecucion(
  {Restaurante, :paralelo_spawn, []}
)

# ── 3. PARALELO CON TASK.ASYNC ───────────────────
tiempo_task = Benchmark.determinar_tiempo_ejecucion(
  {Restaurante, :paralelo_task, []}
)

# ── RESULTADOS ───────────────────────────────────
IO.puts("""

══════════════════════════════════════════════════
RESULTADOS
══════════════════════════════════════════════════
  Secuencial   : #{Float.round(tiempo_sec   / 1_000_000, 2)} segundos
  Spawn paralelo: #{Float.round(tiempo_spawn / 1_000_000, 2)} segundos
  Task.async   : #{Float.round(tiempo_task  / 1_000_000, 2)} segundos
""")

IO.puts("Secuencial vs Spawn paralelo:")
IO.puts("   " <> Benchmark.generar_mensaje(tiempo_spawn, tiempo_sec))

IO.puts("Secuencial vs Task.async:")
IO.puts("   " <> Benchmark.generar_mensaje(tiempo_task, tiempo_sec))

IO.puts("Spawn paralelo vs Task.async:")
IO.puts("   " <> Benchmark.generar_mensaje(tiempo_spawn, tiempo_task))
