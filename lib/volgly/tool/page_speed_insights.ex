defmodule Volgly.Tool.PageSpeedInsights do
  @moduledoc """
  Google API tool for performance and mobile frendly analysis
  """
  import Ecto.Query, only: [from: 2]
  import Poison
  alias Volgly.{Repo, PageSpeedTest}

  # Params for call
  @api_key Application.get_env(:volgly, :api_key)
  @page_speed_url "https://www.googleapis.com/pagespeedonline/v2/runPagespeed"
  @timeout 50_000
  @configs [true, "pt_BR", true, "mobile"]

  def analysis(url) do
    run_test(url, last_test_id())
  end

  defp run_test(url, [test_id]) do
    response_test = call config([url] ++ @configs)
    save_analysis(response_test, test_id)

    #response_test
  end

  defp last_test_id do
    query = from p in PageSpeedTest, select: max(p.test_id)
    Repo.all query
  end

  defp save_analysis(response_test, test_id) do
    IO.inspect  Poison.Parser.parse!(response_test.body)
    PageSpeedTest.changeset(%PageSpeedTest{}, %{response_test: response_test.body, response_status: response_test.status_code, test_id: test_id+1})
  end

  defp call(url_request_params) do
    {:ok, response} = HTTPoison.get(url_request_params, [], [connect_timeout: @timeout, recv_timeout: @timeout, timeout: @timeout])
    response
  end

  defp config([url, third_party_filter, locale, screenshot, strategy]) do
    url_request_params = "#{@page_speed_url}?url=#{URI.encode(url)}&filter_third_party_resources=#{third_party_filter}&locale=#{locale}&screenshot=#{screenshot}&strategy=#{strategy}&key=#{@api_key}"
  end
end
