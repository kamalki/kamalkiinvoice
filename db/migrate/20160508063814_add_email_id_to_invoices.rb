class AddEmailIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :email_id, :string
  end
end
