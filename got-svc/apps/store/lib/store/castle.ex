defmodule Store.Castle do
  use Store.Record

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

  def clear() do
    Repo.delete_all(__MODULE__)
  end

  def add(name: name, desc: desc) do
    %__MODULE__{
      name:        name,
      description: desc
    }
    |> Repo.insert!
  end
end
