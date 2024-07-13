defmodule CodeSnippetShareManager.Repo do
  use Ecto.Repo,
    otp_app: :code_snippet_share_manager,
    adapter: Ecto.Adapters.Postgres
end
