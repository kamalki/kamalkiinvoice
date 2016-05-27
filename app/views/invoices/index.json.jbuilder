json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :date, :invoice_number, :customer, :products, :total
  json.url invoice_url(invoice, format: :json)
end
