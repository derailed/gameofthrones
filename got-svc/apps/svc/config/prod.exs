use Mix.Config

config :svc, SvcWeb.Endpoint,
  load_from_system_env: true,
  url:                  [host: "${GOT_SVC_HOST}", port: "${GOT_SVC_PORT}"],
  server:               true,
  secret_key_base:      "${SECRET_KEY_BASE}"

config :logger, level: :info

config :peerage, via: Peerage.Via.Dns,
  dns_name: "got-svc-headless.default.svc.cluster.local",
  app_name: "got-svc",
  log_results: true,
  interval: 5