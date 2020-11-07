defmodule Zurf.Repo.Migrations.ModifyBooksTable do
  use Ecto.Migration

  def change do

    alter table("books") do
      add :description, :text
      add :user_id, references(:users)
    end

    create index(:books, [:user_id])

  end
end
