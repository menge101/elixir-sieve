defmodule Sieve do
@moduledoc """
    Sieve of Eratosthenes
"""
@doc """
    An implementation of the sieve

    ## Examples
        iex> Sieve.sieve(5)
        [2,3,5]
        iex> Sieve.sieve(50)
        [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]
"""
  def sieve(max) do
    sieve([], Enum.to_list(2..max))
  end
  def sieve(primes, []) do
    primes
  end
  def sieve(primes, [prime | candidates]) do
    [prime | sieve(primes, Enum.reject(candidates, fn(num) -> rem(num, prime) == 0 end))]
  end
end