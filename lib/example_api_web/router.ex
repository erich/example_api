defmodule ExampleApiWeb.Router do
  use ExampleApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    resources "/users", ExampleApiWeb.UserController, except: [:new, :edit, :delete, :update]
  end

  scope "/", ExampleApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExampleApiWeb do
  #   pipe_through :api
  # end
end
