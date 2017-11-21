defmodule BaelishWeb.LinksController do
  use BaelishWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"link" => %{"value" => link}}) do
    IO.puts link

    render conn, "create.html"
  end
end
