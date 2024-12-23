defmodule DialyzerErrorRep.Static do
  use Plug.Builder

  plug(Plug.Logger)
  plug(:static)
  plug(:not_found)

  def static(conn, _opts) do
    public_dir = Application.fetch_env!(:dialyzer_error_rep, :public_dir)
    opts = Plug.Static.init(at: "/", from: public_dir)
    Plug.Static.call(conn, opts)
  end

  defp not_found(conn, _opts) do
    send_resp(conn, 404, "not found")
  end
end
