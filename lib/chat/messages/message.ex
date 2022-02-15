defmodule Chat.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :datetime, :naive_datetime
    field :user_uuid, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:user_uuid, :body, :datetime])

    # |> validate_required([:user_uuid, :body, :datetime])
  end
end
