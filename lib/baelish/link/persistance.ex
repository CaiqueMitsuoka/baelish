require IEx
defmodule Link.Persistance do
  def perform(url) do
    persist(url, Baelish.Repo.get_by(Baelish.Link, url: url))
  end

  def persist(url, nil) do
    to_string(url)
    |> Link.Generator.perform
    |> Link.Cache.create(url)
    |> format_link
    |> Baelish.Repo.insert
  end

  def persist(url, link) do
    { :ok, link }
  end

  def format_link({ uid, link }) do
    %Baelish.Link{ uid: to_string(uid), url: to_string(link)}
  end
end
