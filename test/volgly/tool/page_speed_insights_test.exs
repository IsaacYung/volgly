defmodule Volgly.Tool.PageSpeedInsightsTest do
  use ExUnit.Case
  doctest Volgly.Tool.PageSpeedInsights

  alias Volgly.Tool.PageSpeedInsights

  setup do
    {:ok, json_test: File.read! "test/page_speed_insights_test_analisys.json"}
  end

  test "page speed insights json returned", state do
    assert String.jaro_distance(PageSpeedInsights.analysis("https://www.googleapis.com/auth/pubsub"), state[:json_test]) >= 0.95
  end
end
