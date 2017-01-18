defmodule Mix.Tasks.Hello do
  @moduledoc """
  Add mix task test
  """

  use Mix.Task

  @shortdoc "Simply runs the Hello.say/0 command."
  def run(_) do
    IO.puts "Hello"
  end
end
