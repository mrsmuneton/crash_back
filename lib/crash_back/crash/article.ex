defmodule CrashBack.Crash.Article do
  use Ecto.Schema
  import Ecto.Changeset


  schema "articles" do
    field :body, :string
    field :name, :string
    field :timestamp, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:name, :body, :timestamp])
    |> validate_required([:name, :body, :timestamp])
  end
end
