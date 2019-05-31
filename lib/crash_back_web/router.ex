defmodule CrashBackWeb.Router do
  use CrashBackWeb, :router

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

  scope "/", CrashBackWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/items", ItemController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", CrashBackWeb do
  #   pipe_through :api
  # end
end
