defmodule Link.Generator do
  def perform(link) do
    String.slice(UUID.uuid5(:url, link), 0, 8)
  end
end
