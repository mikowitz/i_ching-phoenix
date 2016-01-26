defmodule IChing.HexagramView do
  use IChing.Web, :view

  def render("index.json", %{hexagrams: hexagrams}) do
    render_many(hexagrams, IChing.HexagramView, "hexagram.json")
  end

  def render("show.json", %{hexagram: hexagram}) do
    render_one(hexagram, IChing.HexagramView, "hexagram.json")
  end

  def render("hexagram.json", %{hexagram: hexagram}) do
    %{
      king_wen_number: hexagram.king_wen_number,
      english_name: hexagram.english_name,
      chinese_name: hexagram.chinese_name,
      characters: hexagram.characters,
      binary: hexagram.binary,
      judgement: hexagram.judgement.content,
      image: hexagram.image.content
    }
  end
end
