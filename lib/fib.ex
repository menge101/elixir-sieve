defmodule Fib do
  @moduledoc """
  Fibonnaci module
"""
@doc """
    Find the nth Fibonnaci number
    ## Examples
        iex> Fib.fib(1)
        1
        iex> Fib.fib(2)
        1
        iex> Fib.fib(3)
        2
        iex> Fib.fib(4)
        3
        iex> Fib.fib(10)
        55
        iex> Fib.fib(20)
        6765
        iex> Fib.fib(22)
        17711
"""
    def fib(1) do 1 end
    def fib(2) do 1 end
    def fib(n) when n < 3 do
      raise ArgumentError, :message = "#{n} is not a valid fibonnaci number"
    end
    def fib(n) do
      minus_one = Task.async(Fib, :fib, [n-1])
      minus_two = Task.async(Fib, :fib, [n-2])
      Task.await(minus_one) + Task.await(minus_two)
    end
end