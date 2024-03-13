defmodule CebuAmRadioDb.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :username, :string
      add :password, :string
      add :name, :string
      add :type, :string, default: "basic", null: false
      add :status, :boolean, default: true, null: false

      timestamps()
    end
  end
end
