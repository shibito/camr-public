defmodule CebuAmRadioDb.Artists.Artist do
  use Ecto.Schema
  use CebuAmRadioDb.Schema
  import Ecto.Changeset

  alias CebuAmRadioDb.Songs.Song
  # alias CebuAmRadioDb.Albums.Album

  schema "artists" do
    field(:name, :string)
    has_many(:song, Song, foreign_key: :artist_uuid)
    # has_many(:album, Album, foreign_key: :artist_uuid)
    has_many :album, through: [:song, :album]

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
