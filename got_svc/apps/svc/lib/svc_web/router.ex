defmodule SvcWeb.Router do
  use SvcWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, [origin: "*"]
    plug :accepts, ["json"]
  end

  scope "/api", SvcWeb do
    pipe_through :api

    resources "/castles", CastleController, only: [:index, :show]
    resources "/minions", MinionController, only: [:index, :show]
  end
end
