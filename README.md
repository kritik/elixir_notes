# Words

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `words` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:words, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/words](https://hexdocs.pm/words).

```elixir
:observer.start - will start stats
Words.count(File.stream!("war-and-peace.txt"))
Words.count_lazy(File.stream!("war-and-peace.txt"), Stream)


iex(4)> self()
#PID<0.162.0>
iex(5)> me = self()
#PID<0.162.0>
iex(6)> Process.alive?(me)
true
iex(7)> other = spawn(fn->IO.puts("Hello!") end)
Hello!
#PID<0.172.0>
iex(8)> Process.alive?(other)
false


iex(1)> self()
#PID<0.132.0>
iex(2)> pid=spawn(fn-> raise "Boom" end)
#PID<0.135.0>
iex(3)>
13:40:52.981 [error] Process #PID<0.135.0> raised an exception
** (RuntimeError) Boom
    (stdlib) erl_eval.erl:678: :erl_eval.do_apply/6

nil
iex(6)> Process.alive?(pid)
false
iex(7)> self()
#PID<0.132.0>
iex(8)> self
#PID<0.132.0>
iex(9)> pid=spawn_link(fn-> raise "Boom" end) # connects new process with existing
** (EXIT from #PID<0.132.0>) shell process exited with reason: an exception was raised:
    ** (RuntimeError) Boom
        (stdlib) erl_eval.erl:678: :erl_eval.do_apply/6

Interactive Elixir (1.9.4) - press Ctrl+C to exit (type h() ENTER for help)

13:41:38.280 [error] Process #PID<0.144.0> raised an exception
** (RuntimeError) Boom
    (stdlib) erl_eval.erl:678: :erl_eval.do_apply/6
iex(1)> self                                 
#PID<0.145.0>
iex(2)> pid # no pid available as new shell
** (CompileError) iex:2: undefined function pid/0
```


```elixir
table = :ets.new(:books,[:set])
table|>:ets.insert({:fairy_tale, 10, 329})
table|>:ets.insert({:horror_novel, 10, 128})
table|>:ets.lookup(:fairy_tale)
table|>:ets.delete(:fairy_tale)
table|>:ets.delete()

table|>:ets.match({:"$1",9, :"$2"})
[[:horror_novel, 128]]
table|>:ets.select([{{:"$1", 9, :"$3"}, [], [:"$1"]}])
[:horror_novel]
```

```elixir
{:ok, table} = :dets.open_file(:books, [type: :set])
table|>:dets.close()
:erlang.halt
```

```elixir
:mnesia.create_schema([node()])
:mnesia.start()
:mnesia.create_table(Book, [attributes: [:title,:rating,:pages]])
:mnesia.transaction(fn ->
  :mnesia.write({Book, :fairy_tale,9,329})
  :mnesia.write({Book, :fable,5,120})
end)
:mnesia.transaction(fn -> :mnesia.read(Book, :fairy_tale) end)
```
