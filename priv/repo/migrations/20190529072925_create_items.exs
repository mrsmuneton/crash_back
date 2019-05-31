defmodule CrashBack.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :body, :string
      add :timestamp, :naive_datetime

      timestamps()
    end

  end
end
