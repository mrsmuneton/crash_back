defmodule CrashBackWeb.ArticleView do
  use CrashBackWeb, :view
  alias CrashBackWeb.ArticleView

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      name: article.name,
      body: article.body,
      timestamp: article.timestamp}
  end
end
