defmodule PathfindingTest do
  use ExUnit.Case
  doctest Pathfinding

  test "block at" do
    assert Pathfinding.block_at(0, 0) == false
  end
end
