defmodule Zurf.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :pwd, :string, virtual: true
    field :username, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:username, :email, :pwd])
    |> validate_required([:username, :email, :pwd])
    |> password_changeset()
    |> unique_constraint(:email)
  end

  def password_changeset(%Ecto.Changeset{changes: %{pwd: password}} = changeset) do
    hashed_password = Bcrypt.hash_pwd_salt(password)
    put_change(changeset, :password, hashed_password)
  end

  def password_changeset(changeset), do: changeset
end
