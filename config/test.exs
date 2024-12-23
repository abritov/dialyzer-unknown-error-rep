import Config

config :dialyzer_error_rep,
  port: String.to_integer(System.get_env("PORT", "8000")),
  public_dir: System.get_env("PUBLIC_DIR", "shared"),
  private_key: File.read!("fixtures/private_key_base64.txt") |> String.trim_trailing()
