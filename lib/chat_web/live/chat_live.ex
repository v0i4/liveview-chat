defmodule ChatWeb.ChatLive do
  use ChatWeb, :live_view
  alias Chat.Messages

  def mount(_params, _session, socket) do
    Messages.subscribe()

    {:ok, fetch(socket)}
  end

  def handle_event("send", %{"message" => message}, socket) do
    Messages.create_message(message)

    {:noreply, fetch(socket)}
  end

  def handle_info({Messages, [:message | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, messages: Messages.list_messages())
  end
end
