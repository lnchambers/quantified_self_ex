defmodule SelfQuantifiedExWeb.MealController do
  use SelfQuantifiedExWeb, :controller

  alias SelfQuantifiedEx.Meals
  alias SelfQuantifiedEx.MealFoods
  alias SelfQuantifiedEx.MealFoods.MealFood

  action_fallback SelfQuantifiedExWeb.FallbackController

  def index(conn, _params) do
    meals = Meals.list_meals()
    render(conn, "index.json", meals: meals)
  end

  def show(conn, %{"id" => id}) do
    meal = Meals.get_meal!(id)
    render(conn, "show.json", meal: meal)
  end

  def delete(conn, %{"meal_id" => meal_id, "food_id" => food_id}) do
    meal_food = MealFoods.get_meal_food!(meal_id: meal_id, food_id: food_id)
    with {:ok, %MealFood{}} <- MealFoods.delete_meal_food(meal_food) do
      send_resp(conn, :no_content, "")
    end
  end

  def update(conn, %{"meal_id" => meal_id, "food_id" => food_id}) do
    meal = Meals.get_meal!(meal_id)
    with {:ok, %MealFood{}} <- MealFoods.create_meal_food(meal_id: meal_id, food_id: food_id) do
      render(conn, "show.json", meal: meal)
    end
  end
end
