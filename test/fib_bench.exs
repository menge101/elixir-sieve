inputs = %{
"50" => 50
}

Benchee.run(%{
    "fib" => fn(count) -> Fib.fib(count) end,
    "fib_list" => fn(count) -> Fib.list_fib_head(count) end
}, time: 5, inputs: inputs)