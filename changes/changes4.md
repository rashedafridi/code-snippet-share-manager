## create nav bar and style

```elixir
# migreat scama
mix ecto.migrate
mix phx.server
```

# what i have done

- edit tailwind css to add color and font
- updated app.css to load font
- stored font and logo in static folder
- removed home templated
- on `lib/code_snippet_share_manager_web/controllers/page_controller.ex` chang the code to load app.html not home.html
- created top nevigation on app.html
