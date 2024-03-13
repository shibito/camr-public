defmodule CebuAmRadioDb.Utlities do
  import Ecto.Query, warn: false
  alias CebuAmRadioDb.Repo

  def all(query, opts \\ []) do
    query |> Repo.all(opts)
  end

  def get(query, uuid, opts \\ []) do
    if Ecto.UUID.cast(uuid) == :error do
      nil
    else
      query |> Repo.get(uuid, opts)
    end
  end
end
