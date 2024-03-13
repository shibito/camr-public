defmodule CebuAmRadioDb.Repo.Migrations.CreatePlayedList do
  use Ecto.Migration

  def change do
    create table(:played_list, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :song_uuid, references("songs", column: :id, type: :uuid), null: false

      timestamps()
    end
  end
end
