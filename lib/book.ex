defmodule Book do
  alias Zurf.{Repo, Book}

  def add_author do
  end

  def list_books do
    Repo.all(Book)
  end

  def update_book(%Book{} = _book) do
  end

  def delete_autor do
  end
end
