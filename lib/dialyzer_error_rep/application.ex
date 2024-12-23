defmodule DialyzerErrorRep.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    port = Application.fetch_env!(:dialyzer_error_rep, :port)

    DialyzerErrorRep.RegistryBuilder.build()

    children = [
      {Plug.Cowboy, scheme: :http, plug: DialyzerErrorRep.Router, options: [port: port]}
    ]

    opts = [strategy: :one_for_one, name: DialyzerErrorRep.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
