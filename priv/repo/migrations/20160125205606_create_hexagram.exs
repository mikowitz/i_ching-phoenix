defmodule IChing.Repo.Migrations.CreateHexagram do
  use Ecto.Migration

  def change do
    create table(:hexagrams) do
      add :king_wen_number, :integer
      add :english_name, :string
      add :chinese_name, :string
      add :characters, :string
      add :binary, :integer

      timestamps
    end

    create index(:hexagrams, [:king_wen_number])
  end
end
