use Mix.Config

config :store, Store.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: System.get_env("GOT_PG_DB"),
  username: System.get_env("GOT_PG_USER"),
  password: System.get_env("GOT_PG_PWD"),
  hostname: System.get_env("GOT_PG_HOST"),
  port:     Integer.parse(System.get_env("GOT_PG_PORT") || "5432") |> elem(0)