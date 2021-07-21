class AddCarrierToSpreeShipments < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_shipments, :carrier, :string
  end
end
