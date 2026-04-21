defmodule NQueens do
  defstruct n: 0, board: [], solutions: []

  # función principal
  def solve(n) do
    board =
      for _ <- 1..n do
        for _ <- 1..n, do: 0
      end

    solutions = place_queen(board, 0, n)
    {length(solutions), solutions}
  end

  
  defp place_queen(board, row, n) do
    if row == n do
      [board]
    else
      Enum.flat_map(0..(n - 1), fn col ->
        if valid?(board, row, col, n) do
          new_board = put_queen(board, row, col)
          place_queen(new_board, row + 1, n)
        else
          []
        end
      end)
    end
  end

  # insertar reina
  defp put_queen(board, row, col) do
    List.update_at(board, row, fn r ->
      List.update_at(r, col, fn _ -> 1 end)
    end)
  end

  # comprobar si posición es válida
  defp valid?(board, row, col, n) do
    not column_attack?(board, col, n) and
      not diagonal_attack?(board, row, col, n)
  end

  defp column_attack?(board, col, n) do
    Enum.any?(0..(n - 1), fn r ->
      Enum.at(Enum.at(board, r), col) == 1
    end)
  end

  defp diagonal_attack?(board, row, col, n) do
    Enum.any?(0..(n - 1), fn r ->
      Enum.any?(0..(n - 1), fn c ->
        Enum.at(Enum.at(board, r), c) == 1 and
          abs(r - row) == abs(c - col)
      end)
    end)
  end

  def print_solutions(solutions) do
    Enum.with_index(solutions, 1)
    |> Enum.each(fn {board, i} ->
      IO.puts("Solución #{i}:\n")

      Enum.each(board, fn row ->
        row
        |> Enum.map(fn
          1 -> "Q"
          0 -> "."
        end)
        |> Enum.join(" ")
        |> IO.puts()
      end)

      IO.puts("")
    end)
  end

end

# ejecutar
{num, sols} = NQueens.solve(8)

IO.puts("Numero de soluciones: #{num}\n")
NQueens.print_solutions(sols)
