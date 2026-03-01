# crud.exs
numeros = [1, 2, 3, 4, 2]

defmodule CRUD do
  @doc """
  Agrega un número a la lista.
  """
  def add_number(list, number) do
    list ++ [number]
  end

  @doc """
  Consulta número según posición
  """
  def read_number(list, index) do
    Enum.at(list, index)
  end

  @doc """
  Recorrer
  """
  def algo_number(list) do
    Enum.each(list, fn x -> x end)
  end

  @doc """
  Encontrar según condición
  """
  def find_number(list, condition) do
    Enum.find(list, condition)
  end

  @doc """
  Elimina un número de la lista por su índice.
  """
  def delete_number(list, index) do
    List.delete_at(list, index)
  end

  @doc """
  Elimina la primera aparición de un número específico en la lista.
  """
  def delete_first_number(list, number) do
    List.delete(list, number)
  end

  @doc """
  Actualiza un número de la lista por su índice
  """
  def update_number(list, index, new_number) do
    List.replace_at(list, index, new_number)
  end

  # @doc """
  # Muestra la lista
  # """
  # def show_list(list) do
  #   IO.inspect(list)
  #   list
  # end
end

# uso

numeros
|> tap(&IO.inspect(&1, label: "Inicial"))
|> CRUD.delete_number(2)
|> tap(&IO.inspect(&1, label: "Después de delete_number"))
|> CRUD.update_number(3, 10)
|> tap(&IO.inspect(&1, label: "Después de update_number"))
|> CRUD.add_number(5)
|> tap(&IO.inspect(&1, label: "Después de add_number"))
|> CRUD.update_number(4, 11)
|> tap(&IO.inspect(&1, label: "Después de segundo update"))
|> CRUD.delete_first_number(1)
|> tap(&IO.inspect(&1, label: "Después de delete_first_number"))
|> CRUD.read_number(3)
