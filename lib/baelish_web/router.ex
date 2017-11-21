defmodule BaelishWeb.Router do
  use BaelishWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BaelishWeb do
    pipe_through :browser # Use the default browser stack

    get "/", LinksController, :new
    post "/links", LinksController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", BaelishWeb do
  #   pipe_through :api
  # end
end
