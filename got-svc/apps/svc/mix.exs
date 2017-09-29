defmodule Svc.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :svc,
      version:         "0.0.1",
      build_path:      "../../_build",
      config_path:     "../../config/config.exs",
      deps_path:       "../../deps",
      lockfile:        "../../mix.lock",
      elixir:          "~> 1.5",
      elixirc_paths:   elixirc_paths(Mix.env),
      compilers:       [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      deps:            deps()
    ]
  end

  def application do
    [
      mod: {Svc.Application, []},
      extra_applications: [:logger, :phoenix_pubsub, :runtime_tools, :peerage]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:phoenix            , "~> 1.3.0"},
      {:phoenix_pubsub     , "~> 1.0"},
      {:phoenix_html       , "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext            , "~> 0.11"},
      {:cowboy             , "~> 1.0"},
      {:cors_plug          , "~> 1.1"},
      {:store              , in_umbrella: true},
      {:peerage            , "~> 1.0.2"}
    ]
  end
end
