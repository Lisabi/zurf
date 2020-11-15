defmodule Zurf.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    belongs_to(:author, Zurf.Author)

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :author_id, :user_id])
    |> assoc_constraint(:author)
  end
end
