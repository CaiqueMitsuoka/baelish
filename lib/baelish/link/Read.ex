defmodule LinkRead do
  def perform(uid) do
    to_string(uid)
    |> check_cache
    |> check_database
  end

  def check_cache(uid) do
    { LinkCache.read(uid), uid }
  end

  def check_database({ { :ok, url }, uid }) do
    url
  end

  def check_database({ :error, uid }) do
    Baelish.Repo.get_by(Baelish.Link, uid: uid ).url
  end
end
