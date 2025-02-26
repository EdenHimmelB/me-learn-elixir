prefix = fn pre -> fn main -> "#{pre} #{main}" end end
mrs = prefix.("Mrs")
IO.puts(mrs.("Smith"))

IO.puts(prefix.("Elixir").("Rocks"))
