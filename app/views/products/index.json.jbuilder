json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :shop
  json.url product_url(product, format: :json)
end
