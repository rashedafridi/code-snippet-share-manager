
mix local.hex

mix phx.new --version

## create the project with out instaling dependency
```bash
mix phx.new code_snippet_share_manager --no-install --binary-id # binary-id use binary as id in the table no-install -> do not install dependency
```

creat dateabase `docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -d postgres:latest`
```bash
`check database docker inspect` use the ip found in inspect to connect to the postgress with docker pgadmin
#update databASE Config on  `config/dev.exs`
# Configure your database
config :code_snippet_share_manager, CodeSnippetShareManager.Repo,
  username: "postgres",
  password: "mysecretpassword",
  hostname: "localhost",
  database: "code_snippet_share_manager_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
```

## setup pg admin for database monitoring
```bash 
docker pull dpage/pgadmin4:8.9 &&
docker run -p 5050:80 \
    -e "PGADMIN_DEFAULT_EMAIL=rashedafridi@gmail.com" \
    -e "PGADMIN_DEFAULT_PASSWORD=rashed" \
    -d dpage/pgadmin4:8.9
```
## install dependency

mix deps.get

## create authontication

`mix phx.gen.auth Accounts User users`
learn more [documentation](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Auth.html)

# what i have done

- setup database
- setup login system  and take a look at the fiels