defmodule SvcWeb.CastleView do
  use SvcWeb, :view

  def render("index.json", %{castles: castles}) do
    %{data: render_many(castles, SvcWeb.CastleView, "castle.json")}
  end

  def render("show.json", %{castle: castle}) do
    %{data: render_one(castle, SvcWeb.CastleView, "castle.json")}
  end

  def render("castle.json", %{castle: castle}) do
    %{
      id:          castle.id,
      name:        castle.name,
      description: castle.description
    }
  end
end
