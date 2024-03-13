defmodule CebuAmRadioDb.UserManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CebuAmRadioDb.UserManager` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name",
        password: "some password",
        status: true,
        username: "some username"
      })
      |> CebuAmRadioDb.UserManager.create_user()

    user
  end
end
