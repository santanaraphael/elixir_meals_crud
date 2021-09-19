defmodule Exmeal.Meals.Create do
  alias Exmeal.{Error, Meal, Repo}

  def call(params) do
    changeset = Meal.changeset(params)

    with {:ok, %Meal{} = changeset} <- Meal.build(changeset),
         {:ok, %Meal{}} = meal <- Repo.insert(changeset) do
      meal
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
