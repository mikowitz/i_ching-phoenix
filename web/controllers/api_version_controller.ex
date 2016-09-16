defmodule IChing.ApiVersionController do
  use IChing.Web, :controller

  def index(conn, _params) do
    render conn, version: 1
  end
end
