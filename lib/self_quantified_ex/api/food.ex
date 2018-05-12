defmodule SelfQuantifiedEx.Api.Food do
  use Ecto.Schema
  import Ecto.Changeset


  schema "foods" do
    field :calories, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :calories])
    |> validate_required([:name, :calories])
    |> unique_constraint(:name)
  end
end
