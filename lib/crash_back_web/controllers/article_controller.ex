defmodule CrashBackWeb.ArticleController do
  use CrashBackWeb, :controller

  alias CrashBack.Crash
  alias CrashBack.Crash.Article

  action_fallback CrashBackWeb.FallbackController

  def index(conn, _params) do
    articles = Crash.list_articles()
    render(conn, "index.json", articles: articles)
  end

  def create(conn, %{"article" => article_params}) do
    with {:ok, %Article{} = article} <- Crash.create_article(article_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", article_path(conn, :show, article))
      |> render("show.json", article: article)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Crash.get_article!(id)
    render(conn, "show.json", article: article)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Crash.get_article!(id)

    with {:ok, %Article{} = article} <- Crash.update_article(article, article_params) do
      render(conn, "show.json", article: article)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Crash.get_article!(id)
    with {:ok, %Article{}} <- Crash.delete_article(article) do
      send_resp(conn, :no_content, "")
    end
  end
end
