defmodule Store.Castle do
  use Store.Record

  @moduledoc """
  Handles castles persistent records
  """

  schema "castles" do
    field :name       , :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end

  @doc """
  Clear out all castles
  """
  @spec clear :: {integer, nil | [term]} | no_return
  def clear() do
    Repo.delete_all(__MODULE__)
  end

  @doc """
  Add a new castle given a name and a descriptiom
  """
  @spec add(name: String.t, desc: String.t) :: Ecto.Schema.t | no_return
  def add(name: name, desc: desc) do
    %__MODULE__{
      name:        name,
      description: desc
    }
    |> Repo.insert!
  end
end
