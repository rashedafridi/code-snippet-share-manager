- create table Schema using the command
```elixir
mix phx.gen.context Gists Gist gists user_id:references:users name:string description:text markup_text:text
```
`add :user_id, references(:users, on_delete: :delete_all, type: :binary_id)`

- set on_delete: :delete_all 

- create table Schema using the relashipn
```elixir
mix phx.gen.context Gists SavedGist saved_gists user_id:references:users gist_id:references:gists
```
- change `on_delete: :nothing` to `on_delete: :delete_all` 
- create table Schema using the command
```elixir
mix phx.gen.context Comments Comment comments user_id:references:users gist_id:references:gists markup_text:text
```

- change `on_delete: :nothing` to `on_delete: :delete_all` 
- update reference  lib/code_snippet_share_manager/gists/saved_gist.ex
```elixir
    belongs_to :user, CodeSnippetShareManager.Accounts.User
    belongs_to :gist, CodeSnippetShareManager.Gists.Gist
```
- update reference lib/code_snippet_share_manager/gists/gist.ex
```elixir
belongs_to :user, CodeSnippetShareManager.Accounts.User
has_many :comment, CodeSnippetShareManager.Comments.Comment

```
- update reference  lib/code_snippet_share_manager/comments/comment.ex
```elixir
    # field :user_id, :binary_id
    # field :gist_id, :binary_id

    belongs_to :user, CodeSnippetShareManager.Accounts.User
    belongs_to :gist, CodeSnippetShareManager.Gists.Gist

```
- when creating a code snippet gist create the user association so tha t we can puss the current login user
```elixir


def create_saved_gist(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:saved_gists)
    |> SavedGist.changeset(attrs)
    |> Repo.insert()
  end

def create_gist(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:gists)
    |> Gist.changeset(attrs)
    |> Repo.insert()
  end

    
def create_comment(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:comments)
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

```
```elixir
# migreat scama
mix ecto.migrate
mix phx.server
```


# what i have done

- generating a context and schema for gists , comment ,gist_save
- 