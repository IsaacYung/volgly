defmodule Volgly do
  @moduledoc """
  Application Begins
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Volgly.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Volgly.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
