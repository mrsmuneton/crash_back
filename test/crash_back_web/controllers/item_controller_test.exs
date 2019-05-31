defmodule CrashBackWeb.ItemControllerTest do
  use CrashBackWeb.ConnCase

  alias CrashBack.CrashBack
  alias CrashBack.CrashBack.Item

  @create_attrs %{body: "some body", name: "some name", timestamp: ~N[2010-04-17 14:00:00.000000]}
  @update_attrs %{body: "some updated body", name: "some updated name", timestamp: ~N[2011-05-18 15:01:01.000000]}
  @invalid_attrs %{body: nil, name: nil, timestamp: nil}

  def fixture(:item) do
    {:ok, item} = CrashBack.create_item(@create_attrs)
    item
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all items", %{conn: conn} do
      conn = get conn, item_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create item" do
    test "renders item when data is valid", %{conn: conn} do
      conn = post conn, item_path(conn, :create), item: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, item_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some body",
        "name" => "some name",
        "timestamp" => ~N[2010-04-17 14:00:00.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, item_path(conn, :create), item: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update item" do
    setup [:create_item]

    test "renders item when data is valid", %{conn: conn, item: %Item{id: id} = item} do
      conn = put conn, item_path(conn, :update, item), item: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, item_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some updated body",
        "name" => "some updated name",
        "timestamp" => ~N[2011-05-18 15:01:01.000000]}
    end

    test "renders errors when data is invalid", %{conn: conn, item: item} do
      conn = put conn, item_path(conn, :update, item), item: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete item" do
    setup [:create_item]

    test "deletes chosen item", %{conn: conn, item: item} do
      conn = delete conn, item_path(conn, :delete, item)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, item_path(conn, :show, item)
      end
    end
  end

  defp create_item(_) do
    item = fixture(:item)
    {:ok, item: item}
  end
end
