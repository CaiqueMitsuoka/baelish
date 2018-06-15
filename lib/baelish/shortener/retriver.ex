defmodule Shortener.Retriver do
  alias Baelish.Repo
  alias Baelish.Link
  alias Shortener.Cache

  def from_uid(uid) do
    to_string(uid)
    |> check_cache
    |> check_database
  end

  def check_cache(uid) do
    {Cache.read(uid), uid}
  end

  def check_database({{:ok, url}, _uid}) do
    url
  end

  def check_database({:error, uid}) do
    Repo.get_by(Link, uid: uid).url
  end
end
