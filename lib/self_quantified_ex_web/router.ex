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
    resources "/foods", FoodController, except: [:new, :edit]
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", SelfQuantifiedExWeb do
    pipe_through :api
  end
end
