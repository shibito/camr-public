defmodule CebuAmRadioDb.AlbumsTest do
  use CebuAmRadioDb.DataCase

  alias CebuAmRadioDb.Albums

  describe "albums" do
    alias CebuAmRadioDb.Albums.Album

    import CebuAmRadioDb.AlbumsFixtures
    import CebuAmRadioDb.ArtistsFixtures

    @invalid_attrs %{name: nil, cover: nil, year: nil, artist_uuid: nil}

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Albums.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Albums.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      artist = artist_fixture()

      valid_attrs = %{name: "some name", cover: "some cover", year: "some year", artist_uuid: artist.id}

      assert {:ok, %Album{} = album} = Albums.create_album(valid_attrs)
      assert album.name == "some name"
      assert album.cover == "some cover"
      assert album.year == "some year"
      assert album.artist_uuid == artist.id
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Albums.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      artist = artist_fixture()

      update_attrs = %{name: "some updated name", cover: "some updated cover", year: "some updated year", artist_uuid: artist.id}

      assert {:ok, %Album{} = album} = Albums.update_album(album, update_attrs)
      assert album.name == "some updated name"
      assert album.cover == "some updated cover"
      assert album.year == "some updated year"
      assert album.artist_uuid == artist.id
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Albums.update_album(album, @invalid_attrs)
      assert album == Albums.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Albums.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Albums.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Albums.change_album(album)
    end
  end
end
