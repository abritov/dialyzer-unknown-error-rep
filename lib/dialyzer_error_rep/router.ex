defmodule DialyzerErrorRep.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  post "/keys" do
    resp = :erlang.term_to_binary(%{"secret" => "mysecretapikey"})
    conn |> put_resp_content_type("application/vnd.hex+erlang") |> send_resp(201, resp)
  end

  post "/publish" do
    {:ok, body, _new_conn} = Plug.Conn.read_body(conn)
    {:ok, %{metadata: metadata}} = :hex_tarball.unpack(body, :memory)

    public_dir = Application.fetch_env!(:dialyzer_error_rep, :public_dir)
    File.write("#{public_dir}/tarballs/#{metadata["name"]}-#{metadata["version"]}.tar", body)
    DialyzerErrorRep.RegistryBuilder.build()

    url = Application.fetch_env!(:dialyzer_error_rep, :url)
    upload_path = Path.join([url, "packages", metadata["name"], metadata["version"]])
    resp = :erlang.term_to_binary(%{"html_url" => upload_path})
    conn |> put_resp_content_type("application/vnd.hex+erlang") |> send_resp(201, resp)
  end

  forward("/", to: DialyzerErrorRep.Static)
end
