import Config

config :dialyzer_error_rep,
  registry_name: "test",
  url: "http://localhost:8000",
  port: String.to_integer(System.get_env("PORT", "8000")),
  public_dir: System.get_env("PUBLIC_DIR", "shared"),
  private_key: System.get_env("PRIVATE_KEY_BASE64")

import_config "#{config_env()}.exs"
