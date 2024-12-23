# dialyzer unknown error reproduce

In this project dialyzer emits errors where it can't find core and other functions from Elixir like that:
```
deps/plug/lib/plug/router.ex:1:callback_info_missing
Callback info about the Plug behaviour is not available.
________________________________________________________________________________
deps/plug/lib/plug/router.ex:234:unknown_function
Function Plug.Router.Utils.decode_path_info!/1 does not exist.
________________________________________________________________________________
deps/plug/lib/plug/router.ex:242:unknown_function
Function :telemetry.span/3 does not exist.
________________________________________________________________________________
deps/plug/lib/plug/router.ex:252:unknown_function
Function Plug.Conn.WrapperError.reraise/4 does not exist.
```

Run to start:
```
asdf install
mix deps.get
PRIVATE_KEY_BASE64=`openssl genrsa -out - | base64` iex -S mix
```

To get dialyzer errors run:
```
mix dialyzer
```
