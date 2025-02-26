defmodule MyList do
  @moduledoc """
  A collection of utility functions for working with lists.
  """

  @doc """
  Applies a given function to each element of the list.
  """
  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  @doc """
  Sums all elements in the list, starting from an optional initial value (default: 0).
  """
  def sum(list), do: sum(list, 0)
  def sum([], value), do: value
  def sum([head | tail], value), do: sum(tail, value + head)

  @doc """
  Applies a function to each element of the list and then sums the results.
  """
  def mapsum(list, func), do: list |> map(func) |> sum()
end
