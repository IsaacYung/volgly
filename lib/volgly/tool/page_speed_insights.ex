defmodule Volgly.Tool.PageSpeedInsights do
  @moduledoc """
  Google API tool for performance and mobile frendly analysis
  """

  # Params for call
  @api_key Application.get_env(:volgly, :api_key)
  @page_speed_url "https://www.googleapis.com/pagespeedonline/v2/runPagespeed"
  @timeout 50_000

  def analysis(url, crawl) do
    call config([
      url,
      true,
      "pt_BR",
      true,
      "mobile"
    ])
  end

  def analysis(url) do
    analysis(url, :crawl)
  end

  defp call(url_request_params) do
    {:ok, response} = HTTPoison.get(url_request_params, [], [connect_timeout: @timeout, recv_timeout: @timeout, timeout: @timeout])
    response.body
  end

  defp config([url, third_party_filter, locale, screenshot, strategy]) do
    url_request_params = "#{@page_speed_url}?url=#{URI.encode(url)}&filter_third_party_resources=#{third_party_filter}&locale=#{locale}&screenshot=#{screenshot}&strategy=#{strategy}&key=#{@api_key}"
  end
end
