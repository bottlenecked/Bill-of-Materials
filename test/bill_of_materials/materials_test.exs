defmodule BillOfMaterials.MaterialsTest do
  use BillOfMaterials.DataCase

  alias BillOfMaterials.Materials

  describe "materials" do
    alias BillOfMaterials.Materials.Material

    @valid_attrs %{category: "some category", name: "some name", price: "120.5", revision: 42}
    @update_attrs %{category: "some updated category", name: "some updated name", price: "456.7", revision: 43}
    @invalid_attrs %{category: nil, name: nil, price: nil, revision: nil}

    def material_fixture(attrs \\ %{}) do
      {:ok, material} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Materials.create_material()

      material
    end

    test "list_materials/0 returns all materials" do
      material = material_fixture()
      assert Materials.list_materials() == [material]
    end

    test "get_material!/1 returns the material with given id" do
      material = material_fixture()
      assert Materials.get_material!(material.id) == material
    end

    test "create_material/1 with valid data creates a material" do
      assert {:ok, %Material{} = material} = Materials.create_material(@valid_attrs)
      assert material.category == "some category"
      assert material.name == "some name"
      assert material.price == Decimal.new("120.5")
      assert material.revision == 42
    end

    test "create_material/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Materials.create_material(@invalid_attrs)
    end

    test "update_material/2 with valid data updates the material" do
      material = material_fixture()
      assert {:ok, %Material{} = material} = Materials.update_material(material, @update_attrs)
      assert material.category == "some updated category"
      assert material.name == "some updated name"
      assert material.price == Decimal.new("456.7")
      assert material.revision == 43
    end

    test "update_material/2 with invalid data returns error changeset" do
      material = material_fixture()
      assert {:error, %Ecto.Changeset{}} = Materials.update_material(material, @invalid_attrs)
      assert material == Materials.get_material!(material.id)
    end

    test "delete_material/1 deletes the material" do
      material = material_fixture()
      assert {:ok, %Material{}} = Materials.delete_material(material)
      assert_raise Ecto.NoResultsError, fn -> Materials.get_material!(material.id) end
    end

    test "change_material/1 returns a material changeset" do
      material = material_fixture()
      assert %Ecto.Changeset{} = Materials.change_material(material)
    end
  end
end
