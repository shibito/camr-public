defmodule CebuAmRadioDb.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :artist_uuid, references("artists", column: :id, type: :uuid), null: false
      add :album_uuid, references("albums", column: :id, type: :uuid), null: false
      add :name, :string
      add :request_count, :integer, default: 0

      timestamps()
    end
  end
end
