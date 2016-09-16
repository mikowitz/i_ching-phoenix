defmodule IChing.HexagramView do
  use IChing.Web, :view

  def render("index.json", %{hexagrams: hexagrams}) do
    render_many(hexagrams, IChing.HexagramView, "hexagram_basic.json")
  end

  def render("show.json", %{hexagram: hexagram}) do
    render_one(hexagram, IChing.HexagramView, "hexagram_full.json")
  end

  def render("hexagram_basic.json", %{hexagram: hexagram}) do
    %{
      king_wen_number: hexagram.king_wen_number,
      english_name: hexagram.english_name,
      chinese_name: hexagram.chinese_name,
      characters: hexagram.characters,
      binary: hexagram.binary,

    }
  end

  def render("hexagram_full.json", %{hexagram: hexagram}) do
    render("hexagram_basic.json", %{hexagram: hexagram})
    |> attach_assoc(:judgement, hexagram.judgement)
    |> attach_assoc(:image, hexagram.image)
  end

  defp attach_assoc(json, _, nil), do: json
  defp attach_assoc(json, assoc_type, assoc) do
    json |> Dict.put(assoc_type, assoc.content)
  end
end
