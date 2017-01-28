inputs = %{
"20" => 20
}

Benchee.run(%{
    "fib" => fn(count) -> Fib.Naive.fib(count) end,
    "fib_list" => fn(count) -> Fib.List.fib(count) end
}, time: 5, inputs: inputs)