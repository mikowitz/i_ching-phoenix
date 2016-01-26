defmodule IChing.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :content, :text
      add :hexagram_id, references(:hexagrams, on_delete: :nothing)

      timestamps
    end
    create index(:images, [:hexagram_id])

  end
end
