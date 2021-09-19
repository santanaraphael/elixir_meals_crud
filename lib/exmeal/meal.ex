defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:description, :date, :calories]
  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema("meals") do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :float)

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
