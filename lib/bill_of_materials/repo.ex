defmodule BillOfMaterials.Repo do
  use Ecto.Repo,
    otp_app: :bill_of_materials,
    adapter: Ecto.Adapters.Postgres
end
