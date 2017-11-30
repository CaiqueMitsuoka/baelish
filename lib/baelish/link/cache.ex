defmodule LinkCache do
  use GenServer

  def start_link do
    IO.puts 'Link Cache started...'
    GenServer.start_link(__MODULE__, :ok)
  end

  # Client

  def create(uid, url) do
    GenServer.cast(get_link_cache(), {:create, uid, url})

    { uid, url }
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

  def handle_cast({:create, uid, url}, urls) do
    if Map.has_key?(urls, uid) do
      {:noreply, urls}
    else
      {:noreply, Map.put(urls, uid, url)}
    end
  end

  # Others

  def find_process([ head | processes ]) do
    { module, pid, :supervisor, [_] } = head

    if module == LinkCache do
      pid
    else
      find_process(processes)
    end
  end

  def find_process([]) do
    nil
  end

  def get_link_cache do
    find_process Supervisor.which_children(Baelish.Supervisor)
  end
end
