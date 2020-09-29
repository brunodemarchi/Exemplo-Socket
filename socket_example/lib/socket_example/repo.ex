defmodule SocketExample.Repo do
  use Ecto.Repo,
    otp_app: :socket_example,
    adapter: Ecto.Adapters.Postgres
end
