cast = [
  %{character: "Buttercup", actor: %{first: "Robin", last: "Wright"}, role: "princess"},
  %{character: "Westley", actor: %{first: "Cary", last: "Elves"}, role: "farm boy"}
]

# IO.inspect(get_in(cast, [Access.all(), :role]))
# IO.puts(get_in(cast, [Access.all(), :role]))

# IO.inspect(get_in(cast, [Access.at(0), :actor]))

IO.inspect(update_in(cast, [Access.all(), :actor, :last], fn val -> String.upcase(val) end))
