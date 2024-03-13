defmodule CebuAmRadioDb.PlayedListTest do
  use CebuAmRadioDb.DataCase

  alias CebuAmRadioDb.PlayedList

  describe "played_list" do
    alias CebuAmRadioDb.PlayedList.Played

    import CebuAmRadioDb.PlayedListFixtures
    import CebuAmRadioDb.SongsFixtures

    @invalid_attrs %{song_uuid: nil}

    test "list_played_list/0 returns all played_list" do
      played = played_fixture()
      assert PlayedList.list_played_list() == [played]
    end

    test "get_played!/1 returns the played with given id" do
      played = played_fixture()
      assert PlayedList.get_played!(played.id) == played
    end

    test "create_played/1 with valid data creates a played" do
      song = song_fixture()

      valid_attrs = %{song_uuid: song.id}

      assert {:ok, %Played{} = played} = PlayedList.create_played(valid_attrs)
      assert played.song_uuid == song.id
    end

    test "create_played/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PlayedList.create_played(@invalid_attrs)
    end

    test "update_played/2 with valid data updates the played" do
      played = played_fixture()
      song = song_fixture()

      update_attrs = %{song_uuid: song.id}

      assert {:ok, %Played{} = played} = PlayedList.update_played(played, update_attrs)
      assert played.song_uuid == song.id
    end

    test "update_played/2 with invalid data returns error changeset" do
      played = played_fixture()
      assert {:error, %Ecto.Changeset{}} = PlayedList.update_played(played, @invalid_attrs)
      assert played == PlayedList.get_played!(played.id)
    end

    test "delete_played/1 deletes the played" do
      played = played_fixture()
      assert {:ok, %Played{}} = PlayedList.delete_played(played)
      assert_raise Ecto.NoResultsError, fn -> PlayedList.get_played!(played.id) end
    end

    test "change_played/1 returns a played changeset" do
      played = played_fixture()
      assert %Ecto.Changeset{} = PlayedList.change_played(played)
    end
  end
end
