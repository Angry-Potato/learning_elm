# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :learning_elm,
  ecto_repos: [LearningElm.Repo]

# Configures the endpoint
config :learning_elm, LearningElm.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VCtU/JXur9Q1THvHHpZR24AbwwUdS9wjmsXy/29klG49QQye4JBa93EzyHRQPAAA",
  render_errors: [view: LearningElm.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LearningElm.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
