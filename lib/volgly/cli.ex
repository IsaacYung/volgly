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
                                                pspeed: :pagespeedinsights])


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
end
