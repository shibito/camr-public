defmodule CebuAmRadioDb.PlayedList.PlayedResolver do
  alias CebuAmRadioDb.PlayedList

  def now_playing(_root, param, _info) do
    result =
      PlayedList.load_playing()
      |> relations(param)
      |> PlayedList.get_last()

    {:ok, result}
  end

  defp relations(query, %{join: true}),
    do: query |> PlayedList.relationships([:song_join])

  defp relations(query, _), do: query
end
