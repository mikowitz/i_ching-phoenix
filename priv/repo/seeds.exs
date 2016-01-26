# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IChing.Repo.insert!(%IChing.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Code.require_file("priv/repo/seeds/hexagrams.exs")
Code.require_file("priv/repo/seeds/judgements.exs")
Code.require_file("priv/repo/seeds/images.exs")

defmodule Seeds do
  alias IChing.Repo
  alias IChing.Hexagram
  alias IChing.Judgement
  alias IChing.Image

  def clear_all, do: Enum.each [Judgement, Image, Hexagram], &Repo.delete_all(&1)

  def import_all do
    import_hexagrams(IChing.Seeds.Hexagrams.hexagrams)
    import_judgements(IChing.Seeds.Judgements.judgements |> Enum.with_index)
    import_images(IChing.Seeds.Images.images |> Enum.with_index)
  end

  defp import_hexagrams([]), do: nil
  defp import_hexagrams([hexagram | rest]) do
    hexagram |> import_hexagram
    rest |> import_hexagrams
  end

  defp import_hexagram({king_wen_number, binary, english_name, chinese_name, characters}) do
    Repo.insert!(%Hexagram{
          king_wen_number: king_wen_number,
          binary: binary,
          english_name: english_name,
          chinese_name: chinese_name,
          characters: characters})
  end

  defp import_judgements([]), do: nil
  defp import_judgements([judgement | rest]) do
    judgement |> import_association(:judgement)
    rest |> import_judgements
  end

  defp import_images([]), do: nil
  defp import_images([image | rest]) do
    image |> import_association(:image)
    rest |> import_images
  end

  defp import_association({content, index}, association_type) do
    Repo.get_by!(Hexagram, king_wen_number: index + 1)
    |> Ecto.build_assoc(association_type, content: content)
    |> Repo.insert!
  end
end

Seeds.clear_all
Seeds.import_all
