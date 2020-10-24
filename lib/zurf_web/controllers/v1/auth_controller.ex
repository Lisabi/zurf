defmodule ZurfWeb.V1.AuthController do
  use ZurfWeb, :controller

  def login(conn, params) do
    json(conn, %{message: "successful", params: params})
  end

  def signup(conn, params) do
    json(conn, %{message: "successful", params: params})
  end
end
