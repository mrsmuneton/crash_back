defmodule CrashBack.Repo.Migrations.CreateInfo do
  use Ecto.Migration

  def change do
    create table(:info) do
      add :name, :string
      add :body, :string

      timestamps()
    end

  end
end
