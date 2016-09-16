defmodule IChing.Router do
  use IChing.Web, :router

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

  scope "/", IChing do
    pipe_through :browser # Use the default browser stack

    get "/", HexagramController, :index
    resources "/hexagrams", HexagramController, only: [:index, :show]
  end

  scope "/api", IChing, as: :api do
    pipe_through :api

    get "/current_version", ApiVersionController, :index

    scope "/v1", as: :v1 do
      resources "/hexagrams", HexagramController, only: [:index, :show]
    end
  end
end
