defmodule ZurfWeb.V1.BookView do
  use ZurfWeb, :view

  def render("books.json", %{books: books}) do
    %{data: render_many(books, ZurfWeb.V1.BookView, "book.json"), books: length(books)}
  end

  def render("book.json", %{book: book}) do
    %{title: book.title, author: book.author}
  end
end
