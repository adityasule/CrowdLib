json.array!(@places) do |place|
  json.extract! place, :id, :name, :locationx, :locationy, :crowd, :noise, :comfort
  json.url place_url(place, format: :json)
end
