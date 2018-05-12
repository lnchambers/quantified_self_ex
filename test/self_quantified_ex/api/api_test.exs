defmodule SelfQuantifiedEx.ApiTest do
  use SelfQuantifiedEx.DataCase

  alias SelfQuantifiedEx.Api

  describe "foods" do
    alias SelfQuantifiedEx.Api.Food

    @valid_attrs %{calories: 42, name: "some name"}
    @update_attrs %{calories: 43, name: "some updated name"}
    @invalid_attrs %{calories: nil, name: nil}

    def food_fixture(attrs \\ %{}) do
      {:ok, food} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_food()

      food
    end

    test "list_foods/0 returns all foods" do
      food = food_fixture()
      assert Api.list_foods() == [food]
    end

    test "get_food!/1 returns the food with given id" do
      food = food_fixture()
      assert Api.get_food!(food.id) == food
    end

    test "create_food/1 with valid data creates a food" do
      assert {:ok, %Food{} = food} = Api.create_food(@valid_attrs)
      assert food.calories == 42
      assert food.name == "some name"
    end

    test "create_food/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_food(@invalid_attrs)
    end

    test "update_food/2 with valid data updates the food" do
      food = food_fixture()
      assert {:ok, food} = Api.update_food(food, @update_attrs)
      assert %Food{} = food
      assert food.calories == 43
      assert food.name == "some updated name"
    end

    test "update_food/2 with invalid data returns error changeset" do
      food = food_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_food(food, @invalid_attrs)
      assert food == Api.get_food!(food.id)
    end

    test "delete_food/1 deletes the food" do
      food = food_fixture()
      assert {:ok, %Food{}} = Api.delete_food(food)
      assert_raise Ecto.NoResultsError, fn -> Api.get_food!(food.id) end
    end

    test "change_food/1 returns a food changeset" do
      food = food_fixture()
      assert %Ecto.Changeset{} = Api.change_food(food)
    end
  end
end
