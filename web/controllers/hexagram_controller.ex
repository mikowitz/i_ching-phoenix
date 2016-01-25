defmodule IChing.HexagramController do
  use IChing.Web, :controller

  alias IChing.Hexagram

  def index(conn, _params) do
    hexagrams = Repo.all(from h in Hexagram, order_by: [asc: h.king_wen_number])
    render conn, "index.html", hexagrams: hexagrams
  end
end
