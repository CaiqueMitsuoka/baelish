defmodule BaelishWeb.LinksController do
  use BaelishWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"link" => %{"value" => link}}) do
    {:ok, uid} = LinkGenerator.perform link
    IO.puts uid

    LinkCache.create(uid, link)

    conn
    |> assign(:uid, uid)
    |> render("create.html")
  end

  def link_by_uid(conn, %{"uid" => uid}) do
    { :ok, url } = LinkCache.read(uid)
    IO.puts url

    redirect conn, external: url
  end
end
