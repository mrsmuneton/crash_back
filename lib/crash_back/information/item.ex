defmodule CrashBack.Information.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "items" do
    field :body, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
