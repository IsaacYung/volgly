defmodule Volgly.API.Router.Homepage do
  use Maru.Router

  get "/foo/bar" do
    json(conn, %{ hello: "Vai na fé" })
  end

  get "/togo" do
    json(conn, %{ hello: "Torga" })
  end

  get "/promo" do
    json(conn, %{ hello: "Progma" })
  end
end
