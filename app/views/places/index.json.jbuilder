json.array!(@places) do |place|
  json.extract! place, :id, :name, :locationx, :locationy, :clicks, :crowd_max, :crowd_current, :noise_max, :noise_num, :comfort_max, :comfort_num
  json.url place_url(place, format: :json)
end
