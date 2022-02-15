defmodule Chat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user_uuid, :uuid
      add :user_name, :string, default: "anonymous"
      add :body, :string
      add :datetime, :naive_datetime

      timestamps()
    end
  end
end
