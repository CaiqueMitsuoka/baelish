defmodule BaelishWeb.LinksController do
  use BaelishWeb, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end
end
