defmodule CebuAmRadioDb.Repo.Migrations.CreateArtists do
  use Ecto.Migration

  def change do
    create table(:artists, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string

      timestamps()
    end
  end
end
