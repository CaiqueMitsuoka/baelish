defmodule BaelishWeb.LinksController do
  require Logger
  use BaelishWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"link" => %{"value" => link}}) do
    link = Shortener.Persistance.perform(link)

    conn
    |> assign(:uid, link.uid)
    |> render("create.html")
  end

  def link_by_uid(conn, %{"uid" => uid}) do
    link = Shortener.Retriver.from_uid(uid)
    Logger.info("[URL] [ACCESS] #{link.url}")

    redirect(conn, external: link.url)
  end
end
