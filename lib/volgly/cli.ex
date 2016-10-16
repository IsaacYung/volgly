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

  def run(argv) do
    argv
    |>parse_args
    |>process
  end

  def process(:help) do
    IO.puts """
    commands
    volgly <url>    # Analysis full url bases on <url>/sitemap.xml
    volgly <url> -p # Analysis only on PageSpeed Insights
    volgly <url> -u # Analysis just the url informed
    """
  end

  def process(%{url: url, options: options}) do
    case options do
      :unique ->  Volgly.PageSpeedInsights.analyse(url, :unique)
      :pagespeedinsights ->  Volgly.PageSpeedInsights.analyse(url)
      [:pagespeedinsights, :unique] ->  Volgly.PageSpeedInsights.analyse(url, :unique)
      # :w3c ->  Volgly.W3C.analyse(url)
      # [:w3c, :unique] ->  Volgly.W3C.analyse(url, :unique)
    end
  end

  def process(%{url: url}) do
    Volgly.PageSpeedInsights.analyse(url)
    # Volgly.W3C.analyse(url)
  end
end
