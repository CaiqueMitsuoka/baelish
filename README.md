# Baelish

Baelish is a slippery fast url shortener with memcache and quick response in mind.

Build on top of Elixir, Phoenix and PostgreSQL.

# How does it work?

## Or (for now) its supposed to

Url is created
|> Get its on uid

Request comes with a valid uid
|> Check if url is already on the Cache
|> If not then check the database
|> Respond

# Setup && Development mode

You need Elixir 1.5+ and PostgreSQL.

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
