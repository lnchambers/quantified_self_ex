defmodule SelfQuantifiedExWeb.FoodController do
  use SelfQuantifiedExWeb, :controller

  alias SelfQuantifiedEx.Api
  alias SelfQuantifiedEx.Api.Food

  action_fallback SelfQuantifiedExWeb.FallbackController

  def index(conn, _params) do
    foods = Api.list_foods()
    render(conn, "index.json", foods: foods)
  end

  def create(conn, %{"food" => food_params}) do
    with {:ok, %Food{} = food} <- Api.create_food(food_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", food_path(conn, :show, food))
      |> render("show.json", food: food)
    end
  end

  def show(conn, %{"id" => id}) do
    food = Api.get_food!(id)
    render(conn, "show.json", food: food)
  end

  def update(conn, %{"id" => id, "food" => food_params}) do
    food = Api.get_food!(id)

    with {:ok, %Food{} = food} <- Api.update_food(food, food_params) do
      render(conn, "show.json", food: food)
    end
  end

  def delete(conn, %{"id" => id}) do
    food = Api.get_food!(id)
    with {:ok, %Food{}} <- Api.delete_food(food) do
      send_resp(conn, :no_content, "")
    end
  end
end
