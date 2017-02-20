defmodule Volgly.PageSpeedTest do
  use Ecto.Schema
  import Ecto.Changeset
  import Poison
  alias Volgly.Repo

  schema "page_speed_tests" do
    field :test_id, :integer
    field :response_status, :integer
    field :response_test, :map

    timestamps
  end

  @required_fields ~w(test_id response_status response_test)

  def changeset(page_speed_test, params \\ :empty) do
    page_speed_test
    |> cast(params, @required_fields)
    |> validate_type
    |> add
  end

  defp validate_type(changeset_result) do
    response_test = get_field(changeset_result, :response_test)
    if is_map(response_test) do
      changeset_result
    else
      add_error(changeset_result, :response_test, "Response don't is a map")
    end
  end

  def add(changeset_result) do
    case Repo.insert(changeset_result) do
      {:ok, model} -> IO.puts "# Saved with success"
      {:error, changeset_result} -> IO.puts "# An error has occurred"
    end
  end
end
