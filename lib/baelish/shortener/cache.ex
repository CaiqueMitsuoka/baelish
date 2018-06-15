defmodule Shortener.Cache do
  require Logger
  use GenServer
  alias Baelish.Link

  def start_link do
    Logger.info("Shortener Cache started...")
    GenServer.start_link(__MODULE__, :ok)
  end

  # Client

  def create(uid, url) do
    create(%Link{uid: uid, url: url})
  end

  def create(link) do
    GenServer.cast(get_link_cache(), {:create, link})

    link
  end

  def read(uid) do
    GenServer.call(get_link_cache(), {:read, uid})
  end

  # Server

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:read, uid}, _from, urls) do
    {:reply, Map.fetch(urls, uid), urls}
  end

  def handle_cast({:create, link}, urls) do
    if Map.has_key?(urls, link.uid) do
      {:noreply, urls}
    else
      {:noreply, Map.put(urls, link.uid, link)}
    end
  end

  # Others

  def find_process([head | processes]) do
    {module, pid, :supervisor, [_]} = head

    if module == Shortener.Cache do
      pid
    else
      find_process(processes)
    end
  end

  def find_process([]) do
    nil
  end

  def get_link_cache do
    find_process(Supervisor.which_children(Baelish.Supervisor))
  end
end
