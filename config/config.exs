# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :bug_demo, BugDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6NvhClCzwhhULsH95/Spoiyq5icZEifeQ47u+ognfjOI8emqxBhnrbJdTkqSMnTI",
  render_errors: [view: BugDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BugDemo.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "hNdZcMhXs0fmigpnvnHy4yHKcJZZzMJwk9FIYb/nBaK5mxj5+mfYsigsf45b+KG4"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines, leex: Phoenix.LiveView.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
