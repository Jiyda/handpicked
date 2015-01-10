json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :description, :website, :pricerange, :rating, :imageurl
  json.url provider_url(provider, format: :json)
end
