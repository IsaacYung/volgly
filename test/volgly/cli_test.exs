defmodule CliTest do
  use ExUnit.Case
  doctest Volgly

  import Volgly.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "value returned when pass only the url" do
    assert parse_args(["http://www.alien-code.com"]) == %{url: "http://www.alien-code.com"}
  end

  test "option unique with url" do
    assert parse_args(["http://www.alien-code.com", "-u"]) == %{url: "http://www.alien-code.com", options: :unique}
    assert parse_args(["http://www.alien-code.com", "--unique"]) == %{url: "http://www.alien-code.com", options: :unique}
  end

  test "option pagespeedinsights with url" do
    assert parse_args(["http://www.alien-code.com", "-p"]) == %{url: "http://www.alien-code.com", options: :pagespeedinsights}
    assert parse_args(["http://www.alien-code.com", "--pagespeedinsights"]) == %{url: "http://www.alien-code.com", options: :pagespeedinsights}
  end

  test "two options with url" do
    %{url: "http://www.alien-code.com", options: options_sortcut} = parse_args(["http://www.alien-code.com", "-p", "-u"])
    %{url: "http://www.alien-code.com", options: options_explicit} = parse_args(["http://www.alien-code.com", "--pagespeedinsights", "--unique"])
    assert is_list(options_sortcut) == true
    assert is_list(options_explicit) == true
  end
end
