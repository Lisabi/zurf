defmodule Zurf.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Zurf.User

  schema "users" do
    field :email, :string
    field :password, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
  end
end
