defmodule SelfQuantifiedExWeb.Router do
  use SelfQuantifiedExWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", SelfQuantifiedExWeb do
    scope "/v1" do
      pipe_through :api
      resources "/foods", FoodController, except: [:new, :edit]
    end
  end
end
