defmodule CebuAmRadioDb.Absinthe.Schema do
  use Absinthe.Schema

  alias CebuAmRadioDb.PlayedList.PlayedResolver
  alias CebuAmRadioDb.Albums.AlbumResolver
  alias CebuAmRadioDb.Artists.ArtistResolver
  alias CebuAmRadioDb.Songs.SongResolver

  object :artists do
    field(:id, :id)
    field(:name, :string)
    field(:song, list_of(:song))
    field(:album, list_of(:album))
  end

  object :song do
    field(:id, :id)
    field(:name, :string)
    field(:album, list_of(:album))
    field(:artist, list_of(:artists))
  end

  object :album do
    field(:id, :id)
    field(:name, :string)
    field(:year, :string)
    field(:cover, :string)
    field(:song, list_of(:song))
    field(:artist, list_of(:artists))
  end

  object :played_list do
    field(:id, :id)
    field(:song, :song)
  end

  query do
    @desc "Get all artists"
    field :all_artists, list_of(:artists) do
      arg(:join, :boolean)
      resolve(&ArtistResolver.all_artists/3)
    end

    @desc "Get one artist"
    field :artist, :artists do
      arg(:id, :string)
      arg(:join, :boolean)
      resolve(&ArtistResolver.find_artist/3)
    end

    @desc "Get all songs"
    field :all_songs, list_of(:song) do
      arg(:join, :boolean)
      resolve(&SongResolver.all_songs/3)
    end

    @desc "Get one song"
    field :song, list_of(:song) do
      arg(:id, :string)
      arg(:join, :boolean)
      resolve(&SongResolver.find_song/3)
    end

    @desc "Get all albums"
    field :all_albums, list_of(:album) do
      arg(:join, :boolean)
      resolve(&AlbumResolver.all_albums/3)
    end

    @desc "Get one album"
    field :album, :album do
      arg(:id, :string)
      arg(:join, :boolean)
      resolve(&AlbumResolver.find_album/3)
    end

    @desc "Get Now Playing song"
    field :now_playing, :album do
      arg(:join, :boolean)
      resolve(&PlayedResolver.now_playing/3)
    end
  end
end
