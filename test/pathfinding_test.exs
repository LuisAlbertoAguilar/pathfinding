defmodule PathfindingTest do
  use ExUnit.Case
  doctest Pathfinding

  test "block at" do
    assert Pathfinding.block_at(0, 0) == false
  end

  test "next moves" do
    assert Pathfinding.next_moves(5, 1) == [{7, 4}, {7, 6}]
  end
end
