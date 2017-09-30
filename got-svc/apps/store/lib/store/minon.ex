defmodule Store.Minion do
  use Store.Record

  @moduledoc """
  Handles minions persistent records
  """

  schema "minions" do
    field :name  , :string
    field :avatar, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @spec changeset(Ecto.Schema.t, %{required(atom) => any}) :: Ecto.Schema.t
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :avatar])
    |> validate_required([:name, :avatar])
  end

  @doc """
  Clear out all minions
  """
  @spec clear() :: {integer, nil | [term]} | no_return
  def clear() do
    Repo.delete_all(__MODULE__)
  end

  @doc """
  Adds a new minion given a name and an image name
  """
  @spec add(name: String.t, avatar: String.t) :: Ecto.Schema.t | no_return
  def add(name: name, avatar: img) do
    %__MODULE__{
      name:   name,
      avatar: img
    }
    |> Repo.insert!
  end
end
