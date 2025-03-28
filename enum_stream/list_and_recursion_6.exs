defmodule MyList do
  defp do_flatten([], acc) do
    acc
  end

  defp do_flatten([head | tail], acc) do
    if is_list(head) do
      do_flatten(tail, do_flatten(head, acc))
    else
      do_flatten(tail, [head | acc])
    end
  end

  def flatten(list) do
    do_flatten(list, []) |> Enum.reverse()
  end
end

[[1, 2, [2, 4, [6, 7, 67], 6, 12, 13], [8, 9, 10, [[1, 2, 3]]]]]
|> MyList.flatten()
|> IO.inspect()
