defmodule Volgly.Repo.Migrations.PageSpeedTest do
  use Ecto.Migration

  def change do
    create table(:page_speed_tests) do
      add :response_time, :integer
      add :response_test, :jsonb
    end
  end
end
