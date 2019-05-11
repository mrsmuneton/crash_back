defmodule CrashBack.Repo.Migrations.CreateCreation do
  use Ecto.Migration

  def change do
    create table(:creation) do
      add :name, :string
      add :body, :string

      timestamps()
    end

  end
end
