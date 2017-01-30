inputs = %{
"100000" => 100000,
"1000000" => 1000000
}

Benchee.run(%{
    "original" => fn(count) -> Fib.CachedETS.fib(count) end,
    "flipped" => fn(count) -> Fib.CachedETS.fibb(count) end
}, time: 5, inputs: inputs)