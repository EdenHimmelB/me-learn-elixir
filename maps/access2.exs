cast = [
  %{character: "Buttercup", actor: {"Robin", "Wright"}, role: "princess"},
  %{character: "Westley", actor: {"Cary", "Elves"}, role: "farm boy"}
]

IO.inspect(get_in(cast, [Access.all(), :actor, Access.elem(1)]))

IO.inspect(
  get_and_update_in(cast, [Access.all(), :actor, Access.elem(1)], fn val ->
    {val, String.reverse(val)}
  end)
)
