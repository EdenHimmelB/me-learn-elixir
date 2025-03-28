# defmodule CustomEnum do
#   def filter([], _func), do: []

#   def filter([head | tail], func) do
#     if func.(head) do
#       [head | filter(tail, func)]
#     else
#       filter(tail, func)
#     end
#   end
# end

defmodule FilterTail do
  def filter(list, fun), do: do_filter(list, fun, [])

  defp do_filter([], _fun, acc), do: Enum.reverse(acc)

  defp do_filter([head | tail], fun, acc) do
    if fun.(head) do
      # <--- tail call: nothing happens after
      do_filter(tail, fun, [head | acc])
    else
      do_filter(tail, fun, acc)
    end
  end
end

# IO.inspect(CustomEnum.filter(Enum.take_random(Enum.to_list(1..1_000_000), 1_000_000), &(&1 < 10)))

IO.inspect(FilterTail.filter(Enum.take_random(Enum.to_list(1..1_000_000), 1_000_000), &(rem(&1, 7) == 3)))
