# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :crash_back,
  ecto_repos: [CrashBack.Repo]

# Configures the endpoint
config :crash_back, CrashBackWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hgWxFYhEKzuK/YII5es/pkBwndgcpsmkrZDPHFIDeqX8kAJbpuNhBw37cFdTY7mW",
  render_errors: [view: CrashBackWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CrashBack.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
