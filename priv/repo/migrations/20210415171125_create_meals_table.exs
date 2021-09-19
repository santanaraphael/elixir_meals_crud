defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def up do
    create table("meals") do
      add(:description, :string)
      add(:date, :date)
      add(:calories, :float)

      timestamps()
    end
  end

  def down do
    drop(table("meals"))
  end
end
