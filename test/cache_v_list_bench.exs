inputs = %{
"10k"       => 10000,
"100k"      => 100000,
"1 Mill"    => 1000000
}

Benchee.run(%{
    "cache" => fn(count) -> Fib.CachedETS.fib(count) end,
    "limited_list" => fn(count) -> Fib.LimitedList.fib(count) end
}, time: 5, inputs: inputs)
