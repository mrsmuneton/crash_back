defmodule CrashBack.Item.Ontology do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ontologies" do
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(ontology, attrs) do
    ontology
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
