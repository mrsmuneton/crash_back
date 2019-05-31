defmodule CrashBack.CrashBack.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "items" do
    field :body, :string
    field :name, :string
    field :timestamp, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :body, :timestamp])
    |> validate_required([:name, :body, :timestamp])
  end
end
