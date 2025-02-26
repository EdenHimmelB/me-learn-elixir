fizzbuzz = fn
  {0, 0, _} -> "FizzBuzz"
  {0, _, _} -> "Fizz"
  {_, 0, _} -> "Buzz"
  {_, _, c} -> "#{c}"
end

IO.puts(fizzbuzz.({0, 0, 2}))
IO.puts(fizzbuzz.({0, 1, 2}))
IO.puts(fizzbuzz.({1, 3, 2}))

advanced_fizzbuzz = fn n -> fizzbuzz.({rem(n, 3), rem(n, 5), n}) end
IO.puts(advanced_fizzbuzz.(10))
IO.puts(advanced_fizzbuzz.(11))
IO.puts(advanced_fizzbuzz.(12))
IO.puts(advanced_fizzbuzz.(13))
IO.puts(advanced_fizzbuzz.(14))
IO.puts(advanced_fizzbuzz.(15))
IO.puts(advanced_fizzbuzz.(16))
IO.puts(advanced_fizzbuzz.(17))
