defmodule CebuAmRadioDb.Songs.Song do
  use Ecto.Schema
  use CebuAmRadioDb.Schema
  import Ecto.Changeset

  alias CebuAmRadioDb.PlayedList.Played
  alias CebuAmRadioDb.Artists.Artist
  alias CebuAmRadioDb.Albums.Album

  schema "songs" do
    field :name, :string
    field :request_count, :integer
    belongs_to :artist, Artist, foreign_key: :artist_uuid, references: :id
    belongs_to :album, Album, foreign_key: :album_uuid, references: :id
    has_many :played_list, Played, foreign_key: :song_uuid

    timestamps()
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:artist_uuid, :album_uuid, :name, :request_count])
    |> validate_required([:artist_uuid, :album_uuid, :name, :request_count])
  end
end
