defmodule Volgly.CLI do
  @moduledoc """
  CLI to handle the analysis, requests and results
  """

  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean,
                                                unique: :boolean,
                                                pagespeedinsights: :boolean],
                                      aliases: [h: :help,
                                                u: :unique,
                                                p: :pagespeedinsights])

    case parse do
      {[help: true], _, _} -> :help
      {[unique: true], [url], _} -> %{url: url, options: :unique}
      {[pagespeedinsights: true], [url], _} -> %{url: url, options: :pagespeedinsights}
      {[pagespeedinsights: true, unique: true], [url], _} -> %{url: url, options: [:pagespeedinsights, :unique]}
      {[unique: true, pagespeedinsights: true], [url], _} -> %{url: url, options: [:pagespeedinsights, :unique]}
      {_, [url], _} -> %{url: url}
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """

      usage: volgly <url> <options>

      options:  -u --unique             # Unique url
                -p --pagespeedinsights  # Make a page speed insights tests
                -wh --w3chtml           # Valid w3c html
                -wc --w3ccss            # Valid w3c css
    """
    System.halt(0)
  end

  def process({}) do
    Volgly.Tool.PageSpeedInsights.analysis()
  end

  def run(argv) do
    argv
    |> parse_args
    |> process
  end
end
