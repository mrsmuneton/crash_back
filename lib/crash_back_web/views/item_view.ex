defmodule CrashBackWeb.ItemView do
  use CrashBackWeb, :view

  def render("index.json", %{item: item}) do
    %{
      item: Enum.map(item, &item_json/1)
    }
  end

  def item_json(item) do
    %{
      name: item.name,
      body: item.body,
      inserted_at: item.inserted_at,
      updated_at: item.updated_at
    }
  end
end
