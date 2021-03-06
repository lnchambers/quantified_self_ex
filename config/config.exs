# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :self_quantified_ex,
  ecto_repos: [SelfQuantifiedEx.Repo]

# Configures the endpoint
config :self_quantified_ex, SelfQuantifiedExWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "REwrLb+mCgTbkorPbjV3Rv4xri+mUtq0cnoWBGTvt9aZMSPhIco2ySJodeFRSm5W",
  render_errors: [view: SelfQuantifiedExWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SelfQuantifiedEx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
