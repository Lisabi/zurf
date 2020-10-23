defmodule ZurfWeb.PageController do
  use ZurfWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
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

    conn |> put_layout("admin.html") |> render( "about.html", username: users)
  end
end
