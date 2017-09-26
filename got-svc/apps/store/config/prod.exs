use Mix.Config

config :store, Store.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "${GOT_DB_NAME}",
  username: "${GOT_DB_USER}",
  password: "${GOT_DB_PWD}",
  hostname: "${GOT_DB_HOST}",
  port:     5432