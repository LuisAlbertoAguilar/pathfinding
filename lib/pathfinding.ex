defmodule Pathfinding do
  def ex1 do
    [
      ~w[X X X X X X X X X X],
      ~w[X _ _ _ X X _ X _ X],
      ~w[X _ X _ _ X _ _ _ X],
      ~w[X _ X X _ _ _ X _ X],
      ~w[X _ X _ _ X _ _ _ X],
      ~w[X _ _ _ X X _ X _ X],
      ~w[X _ X _ _ X _ X _ X],
      ~w[X _ X X _ _ _ X _ X],
      ~w[X _ _ _ _ X _ _ _ X],
      ~w[X X X X X X X X X X]
    ]
  end

  def block_at(x, y) do
    val =
      ex1()
      |> Enum.at(x)
      |> Enum.at(y)

    if val == "X" do
      false
    else
      true
    end
  end

  def moves(x, y) do
    [
      {x + 1, y},
      {x - 1, y},
      {x, y + 1},
      {x, y - 1}
    ]
  end

  def next_moves(x, y) do
    moves(x, y)
    |> Enum.filter(fn {newX, newY} -> if block_at(newX, newY), do: {newX, newY} end)
  end
end
