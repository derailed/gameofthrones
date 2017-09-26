#!/bin/sh

# Run migrations and seeds
./got command Elixir.Svc.Commands.Db update_db

# Start the server
./got foreground
