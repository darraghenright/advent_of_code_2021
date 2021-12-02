defmodule Dive do
  defstruct depth: 0, horizontal: 0

  @type driving_instruction :: {String.t(), Integer.t()}
  @type t :: %__MODULE__{
          depth: non_neg_integer(),
          horizontal: non_neg_integer()
        }

  def drive(input) do
    input
    |> convert_driving_instructions()
    |> calculate_driving_position()
    |> then(&(&1.depth * &1.horizontal))
  end

  @spec convert_driving_instructions([String.t()]) :: [driving_instruction()]
  def convert_driving_instructions(instructions) do
    convert_driving_instruction = fn [direction, step] ->
      {direction, String.to_integer(step)}
    end

    instructions
    |> Stream.map(&String.split/1)
    |> Stream.map(convert_driving_instruction)
    |> Enum.to_list()
  end

  @spec calculate_driving_position([driving_instruction()]) :: Dive.t()
  def calculate_driving_position(driving_instructions) do
    Enum.reduce(driving_instructions, %Dive{}, fn
      {"forward", n}, dive -> %Dive{dive | horizontal: dive.horizontal + n}
      {"down", n}, dive -> %Dive{dive | depth: dive.depth + n}
      {"up", n}, dive -> %Dive{dive | depth: dive.depth - n}
    end)
  end
end
