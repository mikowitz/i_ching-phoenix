defmodule IChing.Hexagram do
  use IChing.Web, :model

  schema "hexagrams" do
    field :king_wen_number, :integer
    field :english_name, :string
    field :chinese_name, :string
    field :characters, :string
    field :binary, :integer

    has_one :judgement, IChing.Judgement, on_delete: :delete_all
    has_one :image, IChing.Image, on_delete: :delete_all

    timestamps
  end

  @required_fields ~w(king_wen_number english_name chinese_name characters binary)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
