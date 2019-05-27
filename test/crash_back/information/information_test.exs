defmodule CrashBack.InformationTest do
  use CrashBack.DataCase

  alias CrashBack.Information

  describe "info" do
    alias CrashBack.Information.Info

    @valid_attrs %{body: "some body", name: "some name"}
    @update_attrs %{body: "some updated body", name: "some updated name"}
    @invalid_attrs %{body: nil, name: nil}

    def info_fixture(attrs \\ %{}) do
      {:ok, info} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Information.create_info()

      info
    end

    test "list_info/0 returns all info" do
      info = info_fixture()
      assert Information.list_info() == [info]
    end

    test "get_info!/1 returns the info with given id" do
      info = info_fixture()
      assert Information.get_info!(info.id) == info
    end

    test "create_info/1 with valid data creates a info" do
      assert {:ok, %Info{} = info} = Information.create_info(@valid_attrs)
      assert info.body == "some body"
      assert info.name == "some name"
    end

    test "create_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Information.create_info(@invalid_attrs)
    end

    test "update_info/2 with valid data updates the info" do
      info = info_fixture()
      assert {:ok, info} = Information.update_info(info, @update_attrs)
      assert %Info{} = info
      assert info.body == "some updated body"
      assert info.name == "some updated name"
    end

    test "update_info/2 with invalid data returns error changeset" do
      info = info_fixture()
      assert {:error, %Ecto.Changeset{}} = Information.update_info(info, @invalid_attrs)
      assert info == Information.get_info!(info.id)
    end

    test "delete_info/1 deletes the info" do
      info = info_fixture()
      assert {:ok, %Info{}} = Information.delete_info(info)
      assert_raise Ecto.NoResultsError, fn -> Information.get_info!(info.id) end
    end

    test "change_info/1 returns a info changeset" do
      info = info_fixture()
      assert %Ecto.Changeset{} = Information.change_info(info)
    end
  end

  describe "items" do
    alias CrashBack.Information.Item

    @valid_attrs %{body: "some body", name: "some name"}
    @update_attrs %{body: "some updated body", name: "some updated name"}
    @invalid_attrs %{body: nil, name: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Information.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Information.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Information.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Information.create_item(@valid_attrs)
      assert item.body == "some body"
      assert item.name == "some name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Information.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Information.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.body == "some updated body"
      assert item.name == "some updated name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Information.update_item(item, @invalid_attrs)
      assert item == Information.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Information.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Information.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Information.change_item(item)
    end
  end
end
