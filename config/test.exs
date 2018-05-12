use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :self_quantified_ex, SelfQuantifiedExWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :self_quantified_ex, SelfQuantifiedEx.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "self_quantified_ex_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
