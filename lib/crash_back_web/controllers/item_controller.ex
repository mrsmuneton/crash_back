defmodule CrashBackWeb.ItemController do
  use CrashBackWeb, :controller

  alias CrashBack.CrashBack
  alias CrashBack.CrashBack.Item

  action_fallback CrashBackWeb.FallbackController

  def index(conn, _params) do
    items = CrashBack.list_items()
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- CrashBack.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = CrashBack.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = CrashBack.get_item!(id)

    with {:ok, %Item{} = item} <- CrashBack.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = CrashBack.get_item!(id)
    with {:ok, %Item{}} <- CrashBack.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
