defmodule CebuAmRadioDb.SongsTest do
  use CebuAmRadioDb.DataCase

  alias CebuAmRadioDb.Songs

  describe "songs" do
    alias CebuAmRadioDb.Songs.Song

    import CebuAmRadioDb.SongsFixtures
    import CebuAmRadioDb.ArtistsFixtures
    import CebuAmRadioDb.AlbumsFixtures

    @invalid_attrs %{name: nil, artist_uuid: nil, album_uuid: nil, request_count: nil}

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Songs.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Songs.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      artist = artist_fixture()
      album = album_fixture()

      valid_attrs = %{name: "some name", artist_uuid: artist.id, album_uuid: album.id, request_count: 0}

      assert {:ok, %Song{} = song} = Songs.create_song(valid_attrs)
      assert song.name == "some name"
      assert song.artist_uuid == artist.id
      assert song.album_uuid == album.id
      assert song.request_count == 0
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Songs.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      artist = artist_fixture()
      album = album_fixture()

      update_attrs = %{name: "some updated name", artist_uuid: artist.id, album_uuid: album.id, request_count: 11}

      assert {:ok, %Song{} = song} = Songs.update_song(song, update_attrs)
      assert song.name == "some updated name"
      assert song.artist_uuid == artist.id
      assert song.album_uuid == album.id
      assert song.request_count == 11
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Songs.update_song(song, @invalid_attrs)
      assert song == Songs.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Songs.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Songs.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Songs.change_song(song)
    end
  end
end
