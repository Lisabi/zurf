defmodule ZurfWeb.PageController do
  use ZurfWeb, :controller
  alias ZurfWeb.Plugs.Locale

  plug Locale, "en"
  # when action in [:index, :show]

  def index(conn, _params) do
    conn
    |> assign(:title, "Welcome to Zurf")
    |> put_layout("zurf_base.html")
    |> render("home.html")
  end

  def show(conn, _params) do
    conn |> render("home.html")
  end

  def sample(conn, _) do
    conn |> text("Hello there")
  end

  def about(conn, params) do
    IO.inspect(params)

    users = [
      %{
        username: "@dageus",
        description: "Both the router and controller module names will be "
      },
      %{
        username: "@lisabi",
        description: "Prefixed with the name you gave your application instead of"
      }
    ]

    conn |> put_layout("admin.html") |> render("about.html", username: users)
  end
end
