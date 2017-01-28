defmodule FibTest do
    defmodule NaiveTest do
        use ExUnit.Case
        doctest Fib.Naive

        test "the truth" do
          assert 1 + 1 == 2
        end
    end

    defmodule TaskedTest do
      use ExUnit.Case
      doctest Fib.Tasked

      test "truth" do
        assert true == true
      end
    end

    defmodule ListTest do
      use ExUnit.Case
      doctest Fib.List

      test "truth" do
        assert true == true
      end
    end

    defmodule LimitedListTest do
      use ExUnit.Case
      doctest Fib.LimitedList

      test "truth" do
        assert true == true
      end
    end
end
