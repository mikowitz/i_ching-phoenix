defmodule IChing.PageController do
  use IChing.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
