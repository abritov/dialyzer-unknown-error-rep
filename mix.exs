defmodule DialyzerErrorRep.MixProject do
  use Mix.Project

  def project do
    [
      app: :dialyzer_error_rep,
      version: "0.1.0",
      elixir: "~> 1.16",
      elixirc_options: [debug_info: true],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        ct: :test,
        eunit: :test,
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.lint": :test,
        "coveralls.json": :test,
        "coveralls.cobertura": :test
      ],
      test_coverage: [tool: ExCoveralls],
      dialyzer: [
        plt_file: {:no_warn, "dialyzer_cache/dialyzer.plt"},
        list_unused_filters: true,
        plt_add_deps: :apps_direct,
        plt_apps: [
          :asn1,
          :compiler,
          :cowboy,
          :cowboy_telemetry,
          :cowlib,
          :crypto,
          :eex,
          :elixir,
          :hex,
          :inets,
          :kernel,
          :logger,
          :mime,
          :mix,
          :plug,
          :plug_cowboy,
          :plug_crypto,
          :public_key,
          :ranch,
          :ssl,
          :stdlib,
          :telemetry
        ]
        ],
        ignore_warnings: "dialyzer_ignore.exs"
      ],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :mix, :hex],
      mod: {DialyzerErrorRep.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.11"},
      {:plug_cowboy, "~> 2.4"},

      {:ex_check, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:excoveralls, ">= 0.0.0", only: :test},
      {:mix_audit, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:credo, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:dialyxir, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:sobelow, ">= 0.0.0", only: [:dev, :test], runtime: false},
    ]
  end
end
