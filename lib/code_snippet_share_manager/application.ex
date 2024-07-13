defmodule CodeSnippetShareManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CodeSnippetShareManagerWeb.Telemetry,
      CodeSnippetShareManager.Repo,
      {DNSCluster, query: Application.get_env(:code_snippet_share_manager, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CodeSnippetShareManager.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CodeSnippetShareManager.Finch},
      # Start a worker by calling: CodeSnippetShareManager.Worker.start_link(arg)
      # {CodeSnippetShareManager.Worker, arg},
      # Start to serve requests, typically the last entry
      CodeSnippetShareManagerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CodeSnippetShareManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CodeSnippetShareManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
