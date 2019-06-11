defmodule CrashBack.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :name, :string
      add :body, :string
      add :timestamp, :naive_datetime

      timestamps()
    end

  end
end
