defmodule AdventOfCode.DiveTest do
  @moduledoc false
  use ExUnit.Case

  @input [
    "forward 5",
    "down 5",
    "forward 8",
    "up 3",
    "down 8",
    "forward 2"
  ]

  test "parse input" do
    expected = [
      {"forward", 5},
      {"down", 5},
      {"forward", 8},
      {"up", 3},
      {"down", 8},
      {"forward", 2}
    ]

    assert Dive.convert_driving_instructions(@input) == expected
  end

  test "calculate_driving_position" do
    driving_instructions = [
      {"forward", 5},
      {"down", 5},
      {"forward", 8},
      {"up", 3},
      {"down", 8},
      {"forward", 2}
    ]

    dive = Dive.calculate_driving_position(driving_instructions)

    assert %Dive{horizontal: 15, depth: 10} == dive
  end

  test "run" do
    assert Dive.drive(@input) == 150
  end
end
