defmodule IChing.ApiVersionView do
  use IChing.Web, :view

  def render("index.json", %{version: version}) do
    %{ version: version }
  end
end
