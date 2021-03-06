defmodule ZurfWeb.Router do
  use ZurfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ZurfWeb.Plugs.Authenticator
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ZurfWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", AuthController, :show
    get "/profile", AuthController, :profile
    post "/login", AuthController, :login
    get "/signup", AuthController, :signup
    post "/signup", AuthController, :signup_action
    delete "/logout", AuthController, :delete

    get "/library", PageController, :library
  end

  # Other scopes may use custom stacks.
  scope "/api", ZurfWeb do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      post "/login", AuthController, :login
      post "/signup", AuthController, :signup

      resources "/books", BookController
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ZurfWeb.Telemetry
    end
  end
end
