defmodule SelfQuantifiedEx.MealFoods.MealFood do
  use Ecto.Schema
  import Ecto.Changeset


  schema "mealfoods" do
    field :food_id, :id
    field :meal_id, :id

    timestamps()
  end

  @doc false
  def changeset(meal_food, attrs) do
    meal_food
    |> cast(attrs, [])
    |> validate_required([])
  end
end
