defmodule IChing.HexagramTest do
  use IChing.ModelCase

  alias IChing.Hexagram

  @valid_attrs %{king_wen_number: 1, english_name: "English Name", chinese_name: "Chinese Name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hexagram.changeset(%Hexagram{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hexagram.changeset(%Hexagram{}, @invalid_attrs)
    refute changeset.valid?
  end
end
