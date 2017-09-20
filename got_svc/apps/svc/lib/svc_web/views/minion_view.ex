defmodule SvcWeb.MinionView do
  use SvcWeb, :view

  def render("index.json", %{minions: minions}) do
    %{data: render_many(minions, SvcWeb.MinionView, "minion.json")}
  end

  def render("show.json", %{minion: minion}) do
    %{data: render_one(minion, SvcWeb.MinionView, "minion.json")}
  end

  def render("minion.json", %{minion: minion}) do
    %{
      id:     minion.id,
      name:   minion.name,
      avatar: minion.avatar,
    }
  end
end
