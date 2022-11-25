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

  def find_path(initial, {finalX, finalY}) do
    full_path = find_path(initial, [{finalX, finalY, 0}])
    pick_shortest({finalX, finalY}, initial, Enum.reverse(full_path))
  end

  def find_path({initialX, initialY}, [{prevX, prevY, num} | t]) do
    moves =
      next_moves(prevX, prevY)
      |> Enum.map(fn {x, y} -> {x, y, num + 1} end)

    if Enum.member?([{prevX, prevY}], {initialX, initialY}) do
      [{prevX, prevY, num + 1}]
    else
      [{prevX, prevY, num + 1} | find_path({initialX, initialY}, t ++ moves)]
    end
  end

  def pick_shortest(
        {finalX, finalY},
        {initialX, initialY},
        [{ax, ay, anum} | t] = possible_moves
      ) do
    moves = next_moves(ax, ay)

    shortest =
      Enum.filter(possible_moves, fn {x, y, _} -> Enum.member?(moves, {x, y}) end)
      |> Enum.sort_by(fn {_, _, num} -> num end)

    if {finalX, finalY} == {ax, ay} do
      [{ax, ay, anum}]
    else
      [hd(shortest) | pick_shortest({finalX, finalY}, {initialX, initialY}, [hd(shortest) | t])]
    end
  end
end
