defmodule CrashBack.Information.Info do
  use Ecto.Schema
  import Ecto.Changeset


  schema "info" do
    field :body, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(info, attrs) do
    info
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
