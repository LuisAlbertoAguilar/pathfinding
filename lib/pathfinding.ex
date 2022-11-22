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
end
