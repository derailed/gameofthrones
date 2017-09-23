# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :svc,
  namespace: Svc

# Configures the endpoint
config :svc, SvcWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ODDfs4Fc8b/izW84ITcLDkllV2mNC4fWGfHSH9zKy4zySVeiew0mgii91vgUvpJF",
  render_errors: [view: SvcWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Svc.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
