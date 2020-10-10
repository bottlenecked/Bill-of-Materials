defmodule BillOfMaterials.Materials.Material do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "materials" do
    field :category, :string
    field :name, :string
    field :price, :decimal
    field :revision, :integer

    timestamps()
  end

  @doc false
  def changeset(material, attrs) do
    material
    |> cast(attrs, [:name, :category, :price, :revision])
    |> validate_required([:name, :category, :price, :revision])
  end
end
