defmodule Chop do
  def guess(actual, first..last//_ = range) when actual in first..last do
    current_guessed = div(first + last, 2)
    IO.puts("Is it #{current_guessed}")
    guess_number(actual, current_guessed, range)
  end

  def guess(actual, first..last//_) do
    raise ArgumentError,
          "The number #{actual} is out of bounds. It must be between #{first} and #{last}."
  end

  def guess_number(actual, current_guessed, _)
      when current_guessed == actual do
    IO.puts(current_guessed)
  end

  def guess_number(actual, current_guessed, first.._last//_)
      when current_guessed > actual do
    guess(actual, first..(current_guessed - 1))
  end

  def guess_number(actual, current_guessed, _first..last//_)
      when current_guessed < actual do
    guess(actual, (current_guessed + 1)..last)
  end
end

Chop.guess(1001, 1..1000)
