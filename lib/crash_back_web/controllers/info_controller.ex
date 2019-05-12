defmodule CrashBackWeb.InfoController do
  use CrashBackWeb, :controller

  alias CrashBack.Information
  alias CrashBack.Information.Info

  def index(conn, _params) do
    information = Information.list_info()
    render(conn, "index.json", info: information)
  end

  def new(conn, _params) do
    changeset = Information.change_info(%Info{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"info" => info_params}) do
    case Information.create_info(info_params) do
      {:ok, info} ->
        conn
        |> put_flash(:info, "Info created successfully.")
        |> redirect(to: info_path(conn, :show, info))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    info = Information.get_info!(id)
    render(conn, "show.html", info: info)
  end

  def edit(conn, %{"id" => id}) do
    info = Information.get_info!(id)
    changeset = Information.change_info(info)
    render(conn, "edit.html", info: info, changeset: changeset)
  end

  def update(conn, %{"id" => id, "info" => info_params}) do
    info = Information.get_info!(id)

    case Information.update_info(info, info_params) do
      {:ok, info} ->
        conn
        |> put_flash(:info, "Info updated successfully.")
        |> redirect(to: info_path(conn, :show, info))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", info: info, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    info = Information.get_info!(id)
    {:ok, _info} = Information.delete_info(info)

    conn
    |> put_flash(:info, "Info deleted successfully.")
    |> redirect(to: info_path(conn, :index))
  end
end
