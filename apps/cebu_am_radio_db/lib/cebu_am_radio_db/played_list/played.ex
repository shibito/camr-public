defmodule CebuAmRadioDb.PlayedList.Played do
  use Ecto.Schema
  use CebuAmRadioDb.Schema
  import Ecto.Changeset

  alias CebuAmRadioDb.Songs.Song

  schema "played_list" do
    belongs_to :song, Song, foreign_key: :song_uuid, references: :id

    timestamps()
  end

  @doc false
  def changeset(played, attrs) do
    played
    |> cast(attrs, [:song_uuid])
    |> validate_required([:song_uuid])
  end
end
