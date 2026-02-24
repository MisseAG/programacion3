defmodule Maps do
  @moduledoc "Utilidades para mapas"

  def create(map, key, value) do
    Map.put(map, key, value)
  end

  def read(map, key) do
    Map.get(map, key)
  end

  def update(map, key, new_value) do
    if Map.has_key?(map, key) do
      Map.put(map, key, new_value)
    else
      map
    end
  end

  @doc """
  Actualiza el valor asociado a 'key' aplica función
  """
  def update_with(map, key, fun) do
    if Map.has_key?(map, key) do
      Map.update!(map, key, fun)
    else
      map
    end
  end

  def delete(map, key) do
    Map.delete(map, key)
  end

  @doc """
  Aplica una función `fun` a todos los valores del mapa.
  """
  def map_values(map, fun) do
    map
    |> Enum.map(fn {k, v} -> {k, fun.(v)} end)
    |> Enum.into(%{})
  end
end

# ejemplos

map = %{a: 1, b: 2}

map = Maps.create(map, :c, 3)
IO.inspect(map)

IO.inspect(Maps.read(map, :a))

map = Maps.update(map, :a, 10)
IO.inspect(map)

map = Maps.update_with(map, :b, fn v -> v * 5 end)
IO.inspect(map)

map = Maps.delete(map, :c)
IO.inspect(map)

map = Maps.map_values(map, fn v -> v + 1 end)
IO.inspect(map)
