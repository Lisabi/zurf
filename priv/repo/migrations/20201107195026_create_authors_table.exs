defmodule Zurf.Repo.Migrations.CreateAuthorsTable do
  use Ecto.Migration

  def change do
    create table("authors") do
      add :first_name, :string
      add :last_name, :string
      add :bio, :string
      add :date_of_birth, :utc_datetime
    end
  end
end
