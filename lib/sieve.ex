defmodule Sieve do
  import Math
  @moduledoc """
  Documentation for Sieve.
  """

  @doc """
  Do these numbers evenly divide?

  ## Examples

      iex> Sieve.divisible?(1,1)
      true
      iex> Sieve.divisible?(1,2)
      false

  """
  def divisible?(dividend, divisor) do
    rem(dividend, divisor) == 0
  end

  @doc """
  Is this number prime?
  ## Examples

    iex> Sieve.prime?(5)
    true
    iex> Sieve.prime?(6)
    false
  """
  def prime?(num) do
    #known_primes = find_primes(math.sqrt(num))
  end

  @doc """
   Is this number divisible by the numbers in this list?
   ## Examples

    iex> Sieve.divisible_by_list?(5, [2,3])
    false
    iex> Sieve.divisible_by_list?(6, [2,3])
    true
  """
  def divisible_by_list?(num, list) do
    Enum.map(list, &Task.async(fn -> rem(num, &1) == 0 end))
    |> Enum.map(&Task.await/1)
    |> Enum.reduce(fn val, acc -> val or acc end)
  end
end
