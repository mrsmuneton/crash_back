defmodule CrashBack.CrashTest do
  use CrashBack.DataCase

  alias CrashBack.Crash

  describe "articles" do
    alias CrashBack.Crash.Article

    @valid_attrs %{body: "some body", name: "some name", timestamp: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{body: "some updated body", name: "some updated name", timestamp: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{body: nil, name: nil, timestamp: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Crash.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Crash.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Crash.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Crash.create_article(@valid_attrs)
      assert article.body == "some body"
      assert article.name == "some name"
      assert article.timestamp == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Crash.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, article} = Crash.update_article(article, @update_attrs)
      assert %Article{} = article
      assert article.body == "some updated body"
      assert article.name == "some updated name"
      assert article.timestamp == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Crash.update_article(article, @invalid_attrs)
      assert article == Crash.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Crash.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Crash.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Crash.change_article(article)
    end
  end
end
