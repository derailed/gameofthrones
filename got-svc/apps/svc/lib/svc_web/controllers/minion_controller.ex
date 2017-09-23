defmodule SvcWeb.MinionController do
  use SvcWeb, :controller

  alias Store.{Repo, Minion}

  def index(conn, _params) do
    minions = Repo.all(Minion)

    render(conn, "index.json", minions: minions)
  end

  def show(conn, %{"id" => id}) do
    minion = Repo.get!(Minion, id)

    render(conn, "show.json", minion: minion)
  end
end
