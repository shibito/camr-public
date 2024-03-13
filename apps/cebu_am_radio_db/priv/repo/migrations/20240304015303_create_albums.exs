defmodule CebuAmRadioDb.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums, primary_key: false) do
      add :id, :uuid, primary_key: true
      # add :artist_uuid, references("artists", column: :id, type: :uuid), null: false
      add :name, :string
      add :year, :string
      add :cover, :string

      timestamps()
    end
  end
end
