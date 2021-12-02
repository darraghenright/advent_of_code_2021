defmodule AdventOfCodeTest do
  @moduledoc false
  use ExUnit.Case

  alias AdventOfCode

  @input_file "./assets/day_01.txt"

  setup do
    depths =
      @input_file
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Stream.map(&String.to_integer/1)
      |> Enum.to_list()

    %{depths: depths}
  end

  test "day_01_part_01", %{depths: depths} do
    assert AdventOfCode.day_01_part_01(depths) == 1292
  end

  test "day_01_part_02", %{depths: depths} do
    assert AdventOfCode.day_01_part_02(depths) == 1262
  end
end
