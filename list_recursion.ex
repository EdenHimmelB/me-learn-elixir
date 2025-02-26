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
  Reduces a list to a single value using an accumulator and a function.
  """
  def reduce([], value, _func), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  @doc """
  Applies a function to each element of the list and then sums the results.
  """
  def mapsum(list, func), do: list |> map(func) |> sum()

  @doc """
  Finds the maximum value in a list.
  """
  def max([head | tail]) do
    reduce(tail, head, fn x, acc -> if x > acc, do: x, else: acc end)
  end

  def caesar([], _n), do: ""

  def caesar(charlist, n) do
    fun = fn char, n ->
      cond do
        char + n > ?z -> ?a + (char + n - ?z)
        true -> char + n
      end
    end

    charlist
    |> Enum.map(&fun.(&1, n))
  end
end
