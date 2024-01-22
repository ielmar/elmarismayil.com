defmodule Elmarismayil.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElmarismayilWeb.Telemetry,
      # Start the Ecto repository
      Elmarismayil.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Elmarismayil.PubSub},
      # Start Finch
      {Finch, name: Elmarismayil.Finch},
      # Start the Endpoint (http/https)
      ElmarismayilWeb.Endpoint
      # Start a worker by calling: Elmarismayil.Worker.start_link(arg)
      # {Elmarismayil.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elmarismayil.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElmarismayilWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
