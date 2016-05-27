class AddColumnToProductinvoice < ActiveRecord::Migration
  def change
  	add_column :productinvoices, :product_id, :integer
    add_column :productinvoices, :invoice_id, :integer
  end
end
