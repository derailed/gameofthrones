defmodule Store.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :store,
      version:         "0.1.0",
      build_path:      "../../_build",
      config_path:     "../../config/config.exs",
      deps_path:       "../../deps",
      lockfile:        "../../mix.lock",
      elixir:          "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps:            deps()
    ]
  end

  def application do
    [
      extra_applications: [
        :logger,
        :postgrex,
        :ecto
      ],
      mod: {Store.Application, []}
    ]
  end

  defp deps do
    [
      {:postgrex, "~> 0.13.3"},
      {:ecto    , "~> 2.2.4"}
    ]
  end
end
