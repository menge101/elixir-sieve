defmodule Fib do
    @moduledoc """
    Fibonacci implementations
    """

    defmodule Naive do
    @moduledoc """
    Naive implementation.
    """
        @doc """
        Find the nth Fibonnaci number, this implementation will crash and burn on 30+.  So it is effectivley garbage.
        This is caused by the Task.async calls.  It quickly has spawned too many processes for the system to handle.
        The list implementation below is vastly superior.
        ## Examples
            iex> Fib.Naive.fib(1)
            1
            iex> Fib.Naive.fib(2)
            1
            iex> Fib.Naive.fib(3)
            2
            iex> Fib.Naive.fib(4)
            3
            iex> Fib.Naive.fib(10)
            55
            iex> Fib.Naive.fib(20)
            6765
        """
        def fib(1) do 1 end
        def fib(2) do 1 end
        def fib(n) when n < 3 do
          raise ArgumentError, :message = "#{n} is not a valid fibonnaci number"
        end
        def fib(n) do
          fib(n-1) + fib(n-2)
        end
    end

    defmodule Tasked do
    @moduledoc """
    Fibonacci implementation using Task.async to parrallelize the recursive calls.  Bad idea.
    """
        @doc """
        Find the nth Fibonnaci number, this implementation will crash and burn on 30+.  So it is effectivley garbage.
        This is caused by the Task.async calls.  It quickly has spawned too many processes for the system to handle.
        The list implementation below is vastly superior.
        ## Examples
            iex> Fib.Tasked.fib(1)
            1
            iex> Fib.Tasked.fib(2)
            1
            iex> Fib.Tasked.fib(3)
            2
            iex> Fib.Tasked.fib(4)
            3
            iex> Fib.Tasked.fib(10)
            55
            iex> Fib.Tasked.fib(20)
            6765
            iex> Fib.Tasked.fib(25)
            75025
        """
        def fib(1) do 1 end
        def fib(2) do 1 end
        def fib(n) when n < 3 do
            raise ArgumentError, :message = "#{n} is not a valid fibonnaci number"
        end
        def fib(n) do
            minus_one = Task.async(Fib.Tasked, :fib, [n-1])
            minus_two = Task.async(Fib.Tasked, :fib, [n-2])
            Task.await(minus_one) + Task.await(minus_two)
        end
    end

    defmodule List do
    @moduledoc """
    Implementation using linked lists.
    """
        @doc """
        Find the nth Fibonacci number, with a list based implementation.
        This will hopefully allow "only once" computation of fibonnaci numbers
        ## Examples
            iex> Fib.List.fib(1)
            1
            iex> Fib.List.fib(2)
            1
            iex> Fib.List.fib(3)
            2
            iex> Fib.List.fib(4)
            3
            iex> Fib.List.fib(10)
            55
            iex> Fib.List.fib(20)
            6765
            iex> Fib.List.fib(22)
            17711
            iex> Fib.List.fib(25)
            75025
            iex> Fib.List.fib(30)
            832040
            iex> Fib.List.fib(50)
            12586269025
        """
        def fib(n) do
            [head | _] = list_fib(n)
            head
        end
        def list_fib(1) do
          [1]
        end
        def list_fib(2) do
          [1,1]
        end
        def list_fib(n) do
          fibs = list_fib(n-1)
          [minus_one | [minus_two | _]] = fibs
          [minus_one + minus_two | fibs]
        end
    end

    defmodule LimitedList do
    @moduledoc """
    List based implementation, only keeping two elements in the list.
    """
        @doc """
        Find the nth Fibonacci number, with a list based implementation.
        This will hopefully allow "only once" computation of fibonnaci numbers
        ## Examples
            iex> Fib.LimitedList.fib(1)
            1
            iex> Fib.LimitedList.fib(2)
            1
            iex> Fib.LimitedList.fib(3)
            2
            iex> Fib.LimitedList.fib(4)
            3
            iex> Fib.LimitedList.fib(10)
            55
            iex> Fib.LimitedList.fib(20)
            6765
            iex> Fib.LimitedList.fib(22)
            17711
            iex> Fib.LimitedList.fib(25)
            75025
            iex> Fib.LimitedList.fib(30)
            832040
            iex> Fib.LimitedList.fib(50)
            12586269025
        """
        def fib(n) do
            [head | _] = list_fib(n)
            head
        end
        def list_fib(1) do
            [1]
        end
        def list_fib(2) do
            [1,1]
        end
        def list_fib(n) do
            [minus_one | [minus_two | _]] = list_fib(n-1)
            [minus_one + minus_two, minus_one]
        end
    end
end