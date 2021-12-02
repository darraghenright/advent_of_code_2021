defmodule AdventOfCode do
  @moduledoc false

  alias AdventOfCode.SonarSweep

  def day_01_part_01(inputs) do
    SonarSweep.count_depth_increases(inputs)
  end

  def day_01_part_02(inputs) do
    SonarSweep.count_depth_increases_by_sliding_window(inputs)
  end
end
