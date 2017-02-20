defmodule Volgly.Repo.Migrations.PageSpeedTest do
  use Ecto.Migration

  def change do
    create table(:page_speed_tests) do
      add :test_id, :integer
      add :response_time, :integer
      add :response_test, :map

      timestamps
    end
  end
end
