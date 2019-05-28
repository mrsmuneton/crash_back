defmodule CrashBack.Repo.Migrations.CreateReaction do
  use Ecto.Migration

  def change do
    create table(:reaction) do
      add :factor, :integer
      add :primacy, :string
      add :opposite, :string

      timestamps()
    end

  end
end
