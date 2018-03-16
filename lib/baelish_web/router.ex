defmodule BaelishWeb.Router do
  use BaelishWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    # plug :protect_from_forgery
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BaelishWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", LinksController, :new)
    get("/h/:uid", LinksController, :link_by_uid)
    post("/links", LinksController, :create)
  end

  # Other scopes may use custom stacks.
  # scope "/api", BaelishWeb do
  #   pipe_through :api
  # end
end
