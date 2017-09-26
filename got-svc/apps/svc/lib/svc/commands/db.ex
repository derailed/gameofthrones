defmodule Svc.Commands.Db do
  @moduledoc false

  @doc """
  Update database. Ensures the db exists, is migrated and seeded
  """
  def update_db do
    :ok = ensure_db()
    :ok = ensure_migrate()
  end

  @doc """
  Ensures migrations are up to date
  """
  def ensure_migrate do
    {:ok, _} = Application.ensure_all_started(:ecto)
    {:ok, _} = Application.ensure_all_started(:postgrex)

    Application.load(:store)
    Store.Repo.start_link

    IO.puts "Updating Migrations..."
    path = Application.app_dir(:store, "priv/repo/migrations")
    Ecto.Migrator.run(Store.Repo, path, :up, all: true)

    :ok = ensure_seeds()

    :init.stop()
    :ok
  end

  @doc """
  Ensures seeds are up to date
  """
  def ensure_seeds do
    seed_file = Path.join(Application.app_dir(:store, "priv/repo"), "seeds.exs")
    if File.exists?(seed_file) do
      IO.puts "Loading seeds..."
      Code.eval_file(seed_file)
    end
    :ok
  end

  @doc """
  Ensures database exists if not create it
  """
  def ensure_db do
    {:ok, _} = Application.ensure_all_started(:ecto)
    {:ok, _} = Application.ensure_all_started(:postgrex)
    Application.load(:store)

    Store.Repo.config
    |> Store.Repo.__adapter__.storage_up
    |> case do
      :ok                                 -> IO.puts "The database has been created"; :ok
      {:error, :already_up}               -> IO.puts "The database has already been created"; :ok
      {:error, term} when is_binary(term) -> {:error, "The database couldn't be created: #{term}"}
      {:error, term}                      -> {:error, "The database couldn't be created: #{inspect term}"}
    end
  end
end