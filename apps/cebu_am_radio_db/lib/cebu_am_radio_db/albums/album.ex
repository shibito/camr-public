defmodule CebuAmRadioDb.Albums.Album do
  use Ecto.Schema
  use CebuAmRadioDb.Schema
  import Ecto.Changeset

  alias CebuAmRadioDb.Songs.Song
  # alias CebuAmRadioDb.Artists.Artist

  schema "albums" do
    field :name, :string
    field :cover, :string
    field :year, :string
    # belongs_to :artist, Artist, foreign_key: :artist_uuid, references: :id
    has_many :song, Song, foreign_key: :album_uuid
    has_many :artist, through: [:song, :artist]

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:name, :year, :cover])
    |> validate_required([:name, :year, :cover])
  end
end
