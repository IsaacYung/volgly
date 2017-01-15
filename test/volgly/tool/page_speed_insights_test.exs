defmodule Volgly.Tool.PageSpeedInsightsTest do
  use ExUnit.Case
  doctest Volgly.Tool.PageSpeedInsights

  alias Volgly.Tool.PageSpeedInsights

  setup do
    {:ok, json_test: File.read! "test/page_speed_insights_test_analisys.json"}
  end

  test "page speed insights json returned", state do
    assert PageSpeedInsights.analysis("http://www.pudim.com.br/") == state[:json_test]
  end
end
