defmodule CrashBack.CrashBackTest do
  use CrashBack.DataCase

  alias CrashBack.CrashBack

  describe "items" do
    alias CrashBack.CrashBack.Item

    @valid_attrs %{body: "some body", name: "some name", timestamp: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{body: "some updated body", name: "some updated name", timestamp: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{body: nil, name: nil, timestamp: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CrashBack.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert CrashBack.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert CrashBack.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = CrashBack.create_item(@valid_attrs)
      assert item.body == "some body"
      assert item.name == "some name"
      assert item.timestamp == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CrashBack.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = CrashBack.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.body == "some updated body"
      assert item.name == "some updated name"
      assert item.timestamp == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = CrashBack.update_item(item, @invalid_attrs)
      assert item == CrashBack.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = CrashBack.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> CrashBack.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = CrashBack.change_item(item)
    end
  end
end
