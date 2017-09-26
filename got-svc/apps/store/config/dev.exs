use Mix.Config

config :store, Store.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: System.get_env("GOT_DB_NAME"),
  username: System.get_env("GOT_DB_USER"),
  password: System.get_env("GOT_DB_PWD"),
  hostname: System.get_env("GOT_DB_HOST"),
  port:     Integer.parse(System.get_env("GOT_DB_PORT") || "5432") |> elem(0)