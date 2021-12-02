defmodule AdventOfCode.SonarSweepTest do
  @moduledoc false
  use ExUnit.Case

  alias AdventOfCode.SonarSweep

  @depths [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

  describe "count_depth_increases/1" do
    test "should count the correct number of depth increases" do
      depth_increases = length([200, 208, 210, 207, 240, 269, 263])
      assert depth_increases == SonarSweep.count_depth_increases(@depths)
    end
  end

  describe "count_depth_increases_by_sliding_window/1" do
    test "create_windowed_depths" do
      windowed_depths = [
        [199, 200, 208],
        [200, 208, 210],
        [208, 210, 200],
        [210, 200, 207],
        [200, 207, 240],
        [207, 240, 269],
        [240, 269, 260],
        [269, 260, 263]
      ]

      assert windowed_depths == SonarSweep.create_windowed_depths(@depths)
    end

    test "sum_windowed_depths" do
      windowed_depths = [
        [1, 2, 3],
        [2, 3, 4],
        [3, 4, 5]
      ]

      summed_depths = [6, 9, 12]

      assert SonarSweep.sum_windowed_depths(windowed_depths) == summed_depths
    end

    test "sdf" do
      depth_increases = length([618, 647, 716, 769, 792])
      assert depth_increases == SonarSweep.count_depth_increases_by_sliding_window(@depths)
    end
  end
end
