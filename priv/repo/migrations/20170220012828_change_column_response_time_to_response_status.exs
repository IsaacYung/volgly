defmodule Volgly.Repo.Migrations.ChangeColumnResponseTimeToResponseStatus do
  use Ecto.Migration

  def change do
    rename table(:page_speed_tests), :response_time, to: :response_status
  end
end
