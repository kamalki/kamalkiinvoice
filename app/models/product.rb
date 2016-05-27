class Product < ActiveRecord::Base
	validates :product_name, presence: true
    validates :rate, :numericality => true

	has_many :productinvoices
    has_many :invoices, through: :productinvoices
end
