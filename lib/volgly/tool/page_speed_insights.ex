defmodule Volgly.Tool.PageSpeedInsights do
  @moduledoc """
  Google API tool for performance and mobile frendly analysis
  """
  # https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=https%3A%2F%2Fwww.bidu.com.br&filter_third_party_resources=false&locale=pt_PT&screenshot=true&strategy=mobile&key={YOUR_API_KEY}
  # Params for call
  @user_agent [{"User-agent", "Elixir isaaczoi@gmail.com"}]
  @api_key "AIzaSyAAsD-B3DLrYI5ZkN11uDc2g4U9hatNSV0"

  def analysis([url, third]) do
    IO.puts "Foi"
  end

  def call() do
  end

  def config([url, third_party_filter, locale, rules, screenshot, strategy]) do
  end
end
