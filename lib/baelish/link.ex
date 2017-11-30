defmodule Baelish.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Baelish.Link


  schema "links" do
    field :uid, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%Link{} = link, attrs) do
    link
    |> cast(attrs, [:url, :uid])
    |> validate_required([:url, :uid])
  end
end
