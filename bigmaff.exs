defmodule BigMaff do
  def sum(1) do
    1
  end

  def sum(n) do
    n + sum(n - 1)
  end
end

defmodule CommonDivisor do
  def gcd(a, 0) do
    a
  end

  def gcd(a, b) do
    gcd(b, rem(a, b))
  end
end
