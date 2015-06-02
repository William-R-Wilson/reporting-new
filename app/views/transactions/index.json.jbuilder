json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :date, :vendor, :who, :what, :where, :why, :string, :amount, :amount, :program, :account
  json.url transaction_url(transaction, format: :json)
end
