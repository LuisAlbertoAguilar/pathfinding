defmodule PathfindingTest do
  use ExUnit.Case
  doctest Pathfinding

  test "block at" do
    assert Pathfinding.block_at(0, 0) == false
  end

  test "next moves" do
    assert Pathfinding.next_moves(5, 1) == [{6, 1}, {4, 1}, {5, 2}]
  end

  test "find path" do
    assert Pathfinding.find_path({1, 1}, {5, 2}) == []
  end
end
