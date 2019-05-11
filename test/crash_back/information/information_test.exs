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
end
