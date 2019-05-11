defmodule CrashBack.CreationTest do
  use CrashBack.DataCase

  alias CrashBack.Creation

  describe "creation" do
    alias CrashBack.Creation.Item

    @valid_attrs %{body: "some body", name: "some name"}
    @update_attrs %{body: "some updated body", name: "some updated name"}
    @invalid_attrs %{body: nil, name: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Creation.create_item()

      item
    end

    test "list_creation/0 returns all creation" do
      item = item_fixture()
      assert Creation.list_creation() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Creation.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Creation.create_item(@valid_attrs)
      assert item.body == "some body"
      assert item.name == "some name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Creation.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Creation.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.body == "some updated body"
      assert item.name == "some updated name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Creation.update_item(item, @invalid_attrs)
      assert item == Creation.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Creation.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Creation.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Creation.change_item(item)
    end
  end
end
