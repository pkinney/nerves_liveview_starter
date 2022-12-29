import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

# ## Using releases
#
# If you use `mix release`, you need to explicitly enable the server
# by passing the PHX_SERVER=true when you start it:
#
#     PHX_SERVER=true bin/replace_me_app start
#
# Alternatively, you can use `mix phx.gen.release` to generate a `bin/server`
# script that automatically sets the env var above.
if System.get_env("PHX_SERVER") do
  config :replace_me_app, ReplaceMeAppWeb.Endpoint, server: true
end

if config_env() == :prod do
  # The secret key base is used to sign/encrypt cookies and other secrets.
  # A default value is used in config/dev.exs and config/test.exs but you
  # want to use a different value for prod and you most likely don't want
  # to check this value into version control, so we use an environment
  # variable instead.

  app = :replace_me_app
  host = System.get_env("PHX_HOST") || "#{app}.local"
  port = String.to_integer(System.get_env("PORT") || "80")

  config app, ReplaceMeAppWeb.Endpoint,
    url: [host: host],
    http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
      # for details about using IPv6 vs IPv4 and loopback vs public addresses.
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    secret_key_base: "HEY05EB1dFVSu6KykKHuS4rQPQzSHv4F7mGVB/gnDLrIu75wE/ytBXy2TaL3A6RA",
    cache_static_manifest: "priv/static/cache_manifest.json",
    live_view: [signing_salt: "AAAABjEyERMkxgDh"],
    check_origin: false,
    render_errors: [view: ReplaceMeAppWeb.ErrorView, accepts: ~w(html json), layout: false],
    pubsub_server: ReplaceMeAppWeb.PubSub,
    # Start the server since we're running in a release instead of through `mix`
    server: true,
    # Nerves root filesystem is read-only, so disable the code reloader
    code_reloader: false

  config :phoenix, :json_library, Jason
end
