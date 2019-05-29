defmodule CrashBack.Information.Item do
  use Ecto.Schema
  import Ecto.Changeset
  import CrashBack.Item.Reaction


  schema "items" do
    field :body, :string
    field :name, :string
    has_many :reactions, Item.Reaction
    has_many :comments, {"reaction", Item.Reaction}, foreign_key: :assoc_id

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
