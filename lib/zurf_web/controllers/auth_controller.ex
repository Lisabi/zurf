defmodule ZurfWeb.AuthController do
  use ZurfWeb, :controller

  def show(conn, _params) do
    conn |> put_layout("zurf_base.html") |> render("login.html", title: "Zurf - Login")
  end
end
