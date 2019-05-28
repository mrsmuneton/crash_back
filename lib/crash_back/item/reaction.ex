defmodule CrashBack.Item.Reaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "reaction" do
    field :factor, :integer
    field :opposite, :string
    field :primacy, :string

    timestamps()
  end

  @doc false
  def changeset(reaction, attrs) do
    reaction
    |> cast(attrs, [:factor, :primacy, :opposite])
    |> validate_required([:factor, :primacy, :opposite])
  end
end
