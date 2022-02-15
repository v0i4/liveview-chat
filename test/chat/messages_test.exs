defmodule Chat.MessagesTest do
  use Chat.DataCase

  alias Chat.Messages

  describe "messages" do
    alias Chat.Messages.Message

    import Chat.MessagesFixtures

    @invalid_attrs %{body: nil, datetime: nil, user_uuid: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{body: "some body", datetime: ~N[2022-02-12 22:19:00], user_uuid: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Message{} = message} = Messages.create_message(valid_attrs)
      assert message.body == "some body"
      assert message.datetime == ~N[2022-02-12 22:19:00]
      assert message.user_uuid == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{body: "some updated body", datetime: ~N[2022-02-13 22:19:00], user_uuid: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Message{} = message} = Messages.update_message(message, update_attrs)
      assert message.body == "some updated body"
      assert message.datetime == ~N[2022-02-13 22:19:00]
      assert message.user_uuid == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end
end
