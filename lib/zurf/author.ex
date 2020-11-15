defmodule Zurf.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :first_name, :string
    field :last_name, :string
    field :bio, :string
    field :date_of_birth, :utc_datetime
    has_many(:books, Zurf.Book)
  end

  @required_fields [:first_name, :last_name, :bio]

  def changeset(author, params \\ %{}) do
    author |> cast(params, @required_fields) |> validate_required(@required_fields)
  end
end
