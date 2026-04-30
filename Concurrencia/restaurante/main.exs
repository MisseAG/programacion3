## Cargar módulos
Code.require_file("benchmark.ex")
Code.require_file("restaurante.ex")

num_pedidos = 5
duracion_pedido = 2

IO.puts("""
╔══════════════════════════════════════════════════╗
║   RESTAURANTE CONCURRENTE                        ║
║   #{num_pedidos} pedidos × #{duracion_pedido} segundos cada uno                ║
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


# ── RESULTADOS ───────────────────────────────────
IO.puts("""
══════════════════════════════════════════════════
RESULTADOS
══════════════════════════════════════════════════
  Secuencial   : #{Float.round(tiempo_sec   / 1_000_000, 2)} segundos
  Spawn paralelo: #{Float.round(tiempo_spawn / 1_000_000, 2)} segundos
""")

IO.puts("Secuencial vs Spawn paralelo:")
IO.puts("   " <> Benchmark.generar_mensaje(tiempo_spawn, tiempo_sec))
