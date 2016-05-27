class AddDPhoneNumberToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :phone_number, :string
  end
end
