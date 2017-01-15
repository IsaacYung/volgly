defmodule Volgly.Tool.PageSpeedInsights do
  @moduledoc """
  Google API tool for performance and mobile frendly analysis
  """
  # https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=https%3A%2F%2Fwww.bidu.com.br&filter_third_party_resources=false&locale=pt_PT&screenshot=true&strategy=mobile&key={YOUR_API_KEY}
  # Params for call
  @api_key "AIzaSyCQNoCdB0fDAF7vA0iBwh45FsGfAx2Aq_s"
  @page_speed_url "https://www.googleapis.com/pagespeedonline/v2/runPagespeed?"
  @timeout 50_000

  def analysis(url, crawl) do
    config([
      url,
      true,
      "pt_BR",
      true,
      "mobile"
    ])
    |> call
  end

  def analysis(url) do
    analysis(url, :crawl)
  end

  defp call(url_request_params) do
    HTTPoison.get(url_request_params, [], [connect_timeout: @timeout, recv_timeout: @timeout, timeout: @timeout])
  end

  defp config([url, third_party_filter, locale, screenshot, strategy]) do
    url_request_params = "#{@page_speed_url}url=#{URI.encode(url)}&filter_third_party_resources=#{third_party_filter}&locale=#{locale}&screenshot=#{screenshot}&strategy=#{strategy}&key=#{@api_key}"
  end
end
