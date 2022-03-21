defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :email, :password]

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
