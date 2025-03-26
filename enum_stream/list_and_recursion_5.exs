defmodule CustomEnum do
  def all?([], _function) do
    true
  end

  def all?([head | tail], function) do
    if function.(head) do
      all?(tail, function)
    else
      false
    end
  end

  def any?([head | tail], function) do
    if function.(head) do
      all?(tail, function)
    else
      function.(head)
    end
  end

  # True recursive solution
  # Simple but may lead to stack overflow if the input list is huge
  # def filter([], _function) do
  #   []
  # end

  # def filter([head | tail], function) do
  #   if function.(head) do
  #     [head | filter(tail, function)]
  #   else
  #     filter(tail, function)
  #   end
  # end

  # Tail-recursive solution with accumulator
  # Recursive call is the last thing the function does before returning.
  defp reverse(list), do: reverse(list, [])

  defp reverse([], accumulator) do
    accumulator
  end

  defp reverse([head | tail], accumulator) do
    reverse(tail, [head | accumulator])
  end

  def filter(list, function, accumulator \\ [])

  def filter([], _function, accumulator) do
    reverse(accumulator)
  end

  def filter([head | tail], function, accumulator) do
    if function.(head) do
      filter(tail, function, [head | accumulator])
    else
      filter(tail, function, accumulator)
    end
  end

  # defp do_take(list, count, acc \\ [])

  # defp do_take(_list, 0, acc) do
  #   reverse(acc, [])
  # end

  # defp do_take([head | tail], count, acc) do
  #   do_take(tail, count - 1, [head | acc])
  # end

  # def take(list, count) when (count >= 0) do
  #   if length(list) <= count do
  #     list
  #   else
  #     do_take(list, count)
  #   end
  # end

  # def take(list, count) when (count < 0) do
  #   take(reverse(list, []), abs(count))
  # end

  # better take implementation
  defp do_take(_, 0, acc), do: reverse(acc)
  defp do_take([], _, acc), do: reverse(acc)
  defp do_take([head | tail], count, acc), do: do_take(tail, count - 1, [head | acc])

  def take(list, count) when count >= 0, do: do_take(list, count, [])

  def take(list, count) when count < 0,
    do: list |> reverse() |> do_take(abs(count), []) |> reverse()
end

custom_list = Enum.to_list(1..100)

IO.inspect(CustomEnum.all?([1, 2, 3, 4], &(&1 < 10)))

IO.inspect(CustomEnum.any?([1, 11, 3, 4], &(&1 < 10)))

IO.inspect(CustomEnum.filter(custom_list, &(rem(&1, 7) == 3)))

CustomEnum.take(custom_list, 20) |> inspect() |> IO.puts()

CustomEnum.take(custom_list, -13) |> inspect(charlists: :as_lists) |> IO.puts()
