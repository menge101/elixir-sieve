defmodule Prime do
  import Math
  @moduledoc """
  Documentation for Prime.
  """
  @doc """
  Is this number prime?

  ## Examples
    iex> Prime.prime?(1)
    false
    iex> Prime.prime?(2)
    true
    iex> Prime.prime?(3)
    true
    iex> Prime.prime?(4)
    false
    iex> Prime.prime?(5)
    true
    iex> Prime.prime?(6)
    false
    iex> Prime.prime?(7)
    true
    iex> Prime.prime?(104729)
    true
  """
  def prime?(1) do
    false
  end

  def prime?(2) do
    true
  end

  def prime?(number) do
    Math.sqrt(number)
    |> Float.ceil
    |> trunc
    |> list_primes_lte_to
    |> (fn(list, number) -> !divisible_by_items_in_list?(number, list) end).(number)
  end

  defp concat_if_indivisible(number, list) do
    if divisible_by_items_in_list?(number, list) do
      list
    else
        list ++ [number]
    end
  end
    
  defp list_primes_lte_to(number) when number < 3 do
    [2]
  end

  defp list_primes_lte_to(number) do
    concat_if_indivisible(number, list_primes_lte_to(number - 1))
  end

  @doc """
  Do these numbers evenly divide?

  ## Examples

      iex> Prime.divisible?(1,1)
      true
      iex> Prime.divisible?(1,2)
      false

  """
  def divisible?(dividend, divisor) do
    rem(dividend, divisor) == 0
  end

  @doc """
   Is this number divisible by the numbers in this list?
   ## Examples

    iex> Prime.divisible_by_items_in_list?(5, [2,3])
    false
    iex> Prime.divisible_by_items_in_list?(6, [2,3])
    true
  """
  def divisible_by_items_in_list?(num, list) do
    Enum.map(list, &Task.async(fn -> rem(num, &1) == 0 end))
    |> Enum.map(&Task.await/1)
    |> Enum.reduce(fn val, acc -> val or acc end)
  end
end
