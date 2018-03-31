defmodule Shortener.Persistance do
  alias Baelish.Repo
  alias Baelish.Link
  alias Shortener.Cache
  alias Shortener.Token

  def perform(url) do
    persist(url)
  end

  defp persist(url) do
    to_string(url)
    |> check_existence
    |> insert_database(url)
    |> insert_cache
  end

  defp check_existence(url) do
    token = Token.generate(url)

    %{link: Repo.get_by(Link, uid: token), uid: token}
  end

  defp insert_database(%{link: nil, uid: uid}, url) do
    Repo.insert(%Link{uid: uid, url: url})
  end

  defp insert_database(%{link: link, uid: uid}, _) do
    {:ok, link}
  end

  defp insert_cache({:ok, link}) do
    Cache.create(link)
  end

  defp insert_cache({:error, _}) do
    :error
  end
end
