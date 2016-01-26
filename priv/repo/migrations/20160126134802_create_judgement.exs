defmodule IChing.Repo.Migrations.CreateJudgement do
  use Ecto.Migration

  def change do
    create table(:judgements) do
      add :content, :text
      add :hexagram_id, references(:hexagrams, on_delete: :nothing)

      timestamps
    end
    create index(:judgements, [:hexagram_id])

  end
end
