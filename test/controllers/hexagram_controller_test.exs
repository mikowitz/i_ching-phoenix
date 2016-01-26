defmodule IChing.HexagramControllerTest do
  use IChing.ConnCase

  alias IChing.Hexagram

  setup do
    %Hexagram{}
    |> Hexagram.changeset(%{king_wen_number: 1, english_name: "E Name", chinese_name: "C Name"})
    |> Repo.insert

    :ok
  end

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200)
  end

  test "GET /hexagrams", %{conn: conn} do
    conn = get conn, "/hexagrams"
    assert html_response(conn, 200)
  end

  test "GET /hexagrams/show", %{conn: conn} do
    conn = get conn, "/hexagrams/1"
    assert html_response(conn, 200) =~ "E Name"
  end

  test "GET /api/v1/hexagrams", %{conn: conn} do
    conn = get conn, "/api/v1/hexagrams"
    assert json_response(conn, 200)
  end

  test "GET /api/v1/hexagrams/1", %{conn: conn} do
    conn = get conn, "/api/v1/hexagrams/1"
    assert json_response(conn, 200)
  end
end
