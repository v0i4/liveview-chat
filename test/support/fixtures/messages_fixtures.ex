defmodule Chat.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Chat.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        body: "some body",
        datetime: ~N[2022-02-12 22:19:00],
        user_uuid: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Chat.Messages.create_message()

    message
  end
end
