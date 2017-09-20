use Mix.Config

config :store, ecto_repos: [Store.Repo]

import_config "#{Mix.env}.exs"