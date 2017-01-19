defmodule Volgly.API.Router.Homepage do
  @moduledoc """
  Routes with endpoints for Volgly API
  """
  use Maru.Router

  get "/foo/bar" do
    json(conn, %{hello: "Vai na fé"})
  end
end
