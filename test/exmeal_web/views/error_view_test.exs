defmodule ExmealWeb.ErrorViewTest do
  use ExmealWeb.ConnCase, async: true
  alias Exmeal.Meal
  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(ExmealWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(ExmealWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end

  test "renders changeset" do
    assert render(
             ExmealWeb.ErrorView,
             "error.json",
             result: Meal.changeset(%{foo: "bar"})
           ) ==
             %{
               message: %{
                 calories: ["can't be blank"],
                 date: ["can't be blank"],
                 description: ["can't be blank"]
               }
             }
  end

  test "renders any other result" do
    assert render(
             ExmealWeb.ErrorView,
             "error.json",
             result: "Sorry, Sandwich Lady couldn't understand your meal"
           ) ==
             %{
               message: "Sorry, Sandwich Lady couldn't understand your meal"
             }
  end
end
