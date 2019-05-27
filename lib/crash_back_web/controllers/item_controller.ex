defmodule CrashBackWeb.ItemController do
  use CrashBackWeb, :controller

  alias CrashBack.Information
  alias CrashBack.Information.Item

  action_fallback CrashBackWeb.FallbackController

  def index(conn, _params) do
    items = Information.list_items()
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    IO.puts("this is the thign")
    with {:ok, %Item{} = item} <- Information.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Information.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Information.get_item!(id)

    with {:ok, %Item{} = item} <- Information.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Information.get_item!(id)
    with {:ok, %Item{}} <- Information.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
