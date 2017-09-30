defmodule Store.Minion do
  use Store.Record

  schema "minions" do
    field :name  , :string
    field :avatar, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :avatar])
    |> validate_required([:name, :avatar])
  end

  def clear() do
    Repo.delete_all(__MODULE__)
  end

  def add(name: name, avatar: img) do
    %__MODULE__{
      name:   name,
      avatar: img
    }
    |> Repo.insert!
  end
end
