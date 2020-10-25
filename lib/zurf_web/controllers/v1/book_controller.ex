defmodule ZurfWeb.V1.BookController do
  use ZurfWeb, :controller
  alias Zurf.{Repo, Book}

  def index(conn, _params) do
    books = Repo.all(Book)
    render(conn, "books.json", books: books)
  end
end
