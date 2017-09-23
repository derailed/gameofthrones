use Mix.Config

config :store, Store.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "${GOT_PG_DB}",
  username: "${GOT_PG_USER}",
  password: "${GOT_PG_PWD}",
  hostname: "${GOT_PG_HOST}",
  port:     5432