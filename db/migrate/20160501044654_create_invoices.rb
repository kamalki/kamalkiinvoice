class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.date :date
      t.string :invoice_number
      t.string :customer
      t.string :products
      t.decimal :total, precision: 15, scale: 2, default: 0

      t.timestamps
    end
  end
end
