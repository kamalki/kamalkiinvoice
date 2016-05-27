class CreateProductinvoices < ActiveRecord::Migration
  def change
    create_table :productinvoices do |t|

      t.timestamps
    end
  end
end
