defmodule BaelishWeb.LinksController do
  use BaelishWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"link" => %{"value" => link}}) do
    {:ok, link} = Link.Persistance.perform(link)

    conn
    |> assign(:uid, link.uid)
    |> render("create.html")
  end

  def link_by_uid(conn, %{"uid" => uid}) do
    url = Link.Read.perform(uid)
    IO.puts(url)

    redirect(conn, external: url)
  end
end
