defmodule AdventOfCodeTest do
  @moduledoc false
  use ExUnit.Case

  alias AdventOfCode

  describe "day 01" do
    setup do
      depths =
        "./assets/day_01.txt"
        |> File.stream!()
        |> Stream.map(&String.trim/1)
        |> Stream.map(&String.to_integer/1)
        |> Enum.to_list()

      %{depths: depths}
    end

    test "part 01", %{depths: depths} do
      assert AdventOfCode.day_01_part_01(depths) == 1292
    end

    test "part 02", %{depths: depths} do
      assert AdventOfCode.day_01_part_02(depths) == 1262
    end
  end

  describe "day 02" do
    setup do
      instructions =
        "./assets/day_02.txt"
        |> File.stream!()
        |> Stream.map(&String.trim/1)
        |> Enum.to_list()

      %{instructions: instructions}
    end

    test "part 01", %{instructions: instructions} do
      assert AdventOfCode.day_02_part_01(instructions) |> IO.inspect()
    end
  end
end
