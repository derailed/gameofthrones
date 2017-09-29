use Mix.Config

config :svc,
  namespace: Svc

# Configures the endpoint
config :svc, SvcWeb.Endpoint,
  url:             [host: "localhost"],
  secret_key_base: "ODDfs4Fc8b/izW84ITcLDkllV2mNC4fWGfHSH9zKy4zySVeiew0mgii91vgUvpJF",
  render_errors:   [
                     view:    SvcWeb.ErrorView,
                     accepts: ~w(html json)
                   ],
  pubsub:          [
                     name:    Svc.PubSub,
                     adapter: Phoenix.PubSub.PG2
                   ]

config :logger, :console,
  format:   "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
