defmodule ZurfWeb.PageController do
  use ZurfWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:title, "Welcome to Zurf")
    |> put_layout("zurf_base.html")
    |> render("home.html")
  end

  def show(conn, _params) do
    conn |> render("home.html")
  end
end
