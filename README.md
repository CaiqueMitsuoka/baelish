# Baelish

Baelish is a slippery fast url shortener with memcache and quick response in mind.

Build on top of Elixir, Phoenix and PostgreSQL.

# How does it work?

## Or (for now) its supposed to

Url is created
|> Get its on uid
|> Database persisted
|> Added to cache

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

# About

The project stil needs a lot of polish and features.

If you are interested in collaboration here is what we need right now:

+ [Logo](https://github.com/CaiqueMitsuoka/baelish/issues/1)
+ [FrontEnd](https://github.com/CaiqueMitsuoka/baelish/issues/2)(The entire application, so, you can choose what to do)
+ [Url Validation](https://github.com/CaiqueMitsuoka/baelish/issues/3)
+ [Better cache strategy](https://github.com/CaiqueMitsuoka/baelish/issues/4)
+ [Better error handling](https://github.com/CaiqueMitsuoka/baelish/issues/5)
+ [Uid generation strategy](https://github.com/CaiqueMitsuoka/baelish/issues/6)

Let people know what you are doing in the issues
