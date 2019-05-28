defmodule CrashBack.Repo.Migrations.CreateOntologies do
  use Ecto.Migration

  def change do
    create table(:ontologies) do
      add :type, :string

      timestamps()
    end

  end
end
