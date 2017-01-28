inputs = %{
"100"    => 100,
"1000"   => 1000,
"10000"  => 10000,
"100000" => 100000
}

Benchee.run(%{
    "fib_limited_list" => fn(count) -> Fib.LimitedList.fib(count) end,
    "fib_list" => fn(count) -> Fib.List.fib(count) end
}, time: 5, inputs: inputs)