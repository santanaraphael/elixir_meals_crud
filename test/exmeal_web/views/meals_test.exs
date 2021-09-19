defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  alias Exmeal.Meal

  alias ExmealWeb.MealsView

  test "render create.json" do
    params = %{description: "Banana", date: "2001-05-02", calories: "20"}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20.0,
               date: ~D[2001-05-02],
               description: "Banana",
               id: _id,
               inserted_at: _inserted_at,
               updated_at: _updated_at
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    params = %{description: "Banana", date: "2001-05-02", calories: "20"}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 20.0,
               date: ~D[2001-05-02],
               description: "Banana",
               id: _id
             }
           } = response
  end
end
