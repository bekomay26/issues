defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [ parse_args: 1, sort_into_descending_order: 1 ]
  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end
  test "three values returned if three given" do
    assert parse_args(["user", "project", "99"]) == { "user", "project", 99 }
  end
  test "count is defaulted if two values given" do
    assert parse_args(["user", "project"]) == { "user", "project", 4 }
  end

  test "sort descending orders the correct way" do
    result = sort_into_descending_order(fake_created_at_list(
      ["2018-07-18T11:28:48Z", "2028-07-18T11:28:48Z", "2019-07-18T09:28:48Z", "2019-07-18T09:38:48Z"]
    ))
    issues = for issue <- result, do: Map.get(issue, "created_at")
    assert issues == ~w{ 2028-07-18T11:28:48Z 2019-07-18T09:38:48Z 2019-07-18T09:28:48Z 2018-07-18T11:28:48Z }
  end

  defp fake_created_at_list(values) do
    for value <- values,
        do: %{"created_at" => value, "other_data" => "xxx"}
  end
end