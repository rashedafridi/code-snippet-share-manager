defmodule CodeSnippetShareManager.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CodeSnippetShareManager.Gists` context.
  """

  @doc """
  Generate a gist.
  """
  def gist_fixture(attrs \\ %{}) do
    {:ok, gist} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> CodeSnippetShareManager.Gists.create_gist()

    gist
  end

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    {:ok, saved_gist} =
      attrs
      |> Enum.into(%{

      })
      |> CodeSnippetShareManager.Gists.create_saved_gist()

    saved_gist
  end
end
