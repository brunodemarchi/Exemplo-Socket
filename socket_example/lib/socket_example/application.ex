defmodule SocketExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SocketExample.Repo,
      # Start the Telemetry supervisor
      SocketExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SocketExample.PubSub},
      # Start the Endpoint (http/https)
      SocketExampleWeb.Endpoint,
      # Start a worker by calling: SocketExample.Worker.start_link(arg)
      # {SocketExample.Worker, arg}
      SocketExample.SendCoord
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SocketExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SocketExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
