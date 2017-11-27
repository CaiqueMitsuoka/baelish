defmodule LinkGenerator do
  def perform(link) do
    uid = String.slice(UUID.uuid5(:url, link), 0, 8)

    { :ok, uid }
  end
end
