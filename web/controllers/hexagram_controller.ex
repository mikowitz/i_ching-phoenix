defmodule IChing.HexagramController do
  use IChing.Web, :controller

  alias IChing.Hexagram

  def index(conn, _params) do
    hexagrams = Repo.all(from h in Hexagram, order_by: [asc: h.king_wen_number])
    render conn, hexagrams: hexagrams
  end

  def show(conn, %{"id" => id}) do
    hexagram = Repo.get_by!(Hexagram, king_wen_number: id) |> Repo.preload([:judgement, :image])
    render conn, hexagram: hexagram
  end
end
