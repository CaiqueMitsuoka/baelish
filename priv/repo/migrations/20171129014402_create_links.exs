defmodule Baelish.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add(:url, :string)
      add(:uid, :string)

      timestamps()
    end
  end
end
