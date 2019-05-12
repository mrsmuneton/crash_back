defmodule CrashBackWeb.InfoView do
  use CrashBackWeb, :view

  def render("index.json", %{info: info}) do
    %{
      info: Enum.map(info, &info_json/1)
    }
  end

  def info_json(info) do
    %{
      name: info.name,
      body: info.body,
      inserted_at: info.inserted_at,
      updated_at: info.updated_at
    }
  end

end
