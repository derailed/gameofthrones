defmodule SvcWeb.CastleController do
  use SvcWeb, :controller

  alias Store.{Repo, Castle}

  def index(conn, _params) do
    castles = Repo.all(Castle)
    render(conn, "index.json", castles: castles)
  end

  def show(conn, %{"id" => id}) do
    castle = Repo.get!(Castle, id)
    render(conn, "show.json", castle: castle)
  end
end
