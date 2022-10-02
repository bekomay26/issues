# Issues

**Command line tool for fetching a project's most recent Github issues**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `issues` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:issues, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/issues>.

## Run
- package the program with `mix escript.build`
- run it using ```./issues <github_username> <project> <count(optional)>```
Or
- run with mix using `mix run -e 'Issues.CLI.run(argv)'` 
  - e.g `mix run -e 'Issues.CLI.run(["-h"])'` or ` mix run -e 'Issues.CLI.run(["elixir-lang", "elixir"])'`

## Documentation
- run `mix docs`
