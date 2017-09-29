defmodule SvcWeb.HomeController do
  use SvcWeb, :controller

  def index(conn, _params) do
    conn |> text "G.o.T is listening!"
  end
end
