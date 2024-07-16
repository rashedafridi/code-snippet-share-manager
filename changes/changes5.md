## Dropdown Menu with JS.toggle

- create a conditional base drop-down page on `lib/code_snippet_share_manager_web/components/layouts/app.html.heex`

- add the `<%= @inner_content %>` to add page info


- add js toggle to manage the visibility

```elixir
# lib/code_snippet_share_manager_web/components/layouts/app.ex
defmodule CodeSnippetShareManagerWeb.Layouts.App do
  alias Phoenix.LiveView.JS

  def toggle_dropdown_menu do
    JS.toggle(
      to: "#dropdown_menu",
      in:
        {"transition ease-out duration-100", "transform opacity-0 translate-y-[-10%]",
         "transform opacity-100 translate-y-0"},
      out:
        {"transition ease-in duration-75", "transform opacity-100 translate-y-0",
         "transform opacity-0 translate-y-[-10%]"}
    )
  end
end

```

```elixir

mix phx.server
```

# what i have done

- create a conditional base drop-down
- setup Phoenix.LiveView.JS toggle  to toggle dropdown ref [doc](https://hexdocs.pm/phoenix_live_view/1.0.0-rc.6/Phoenix.LiveView.JS.html)
- used Phoenix click listener like `phx-click-away`  ref [doc](https://hexdocs.pm/phoenix_live_view/bindings.html)