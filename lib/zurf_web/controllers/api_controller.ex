defmodule ZurfWeb.ApiController do
  use ZurfWeb, :controller

  def index(conn, _params) do
    conn |> put_status(200) |> json(%{})
  end

  def edit(_conn, _params) do
  end

  def create(conn, params) do
    title = get_in(params, ["title"])

    case title do
      nil ->
        conn
        |> put_status(400)
        |> json(%{message: "Title cannot be null"})

      _ ->
        conn
        |> put_status(201)
        |> json(%{message: "Book created successfully", book_created: String.upcase(title)})
    end
  end
end
