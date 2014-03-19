json.array!(@products) do |product|
  json.extract! product, :id, : title, :category, :image_url, :shape
  json.url product_url(product, format: :json)
end
