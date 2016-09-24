json.array!(@fake_stripes) do |fake_stripe|
  json.extract! fake_stripe, :id, :tickets
  json.url fake_stripe_url(fake_stripe, format: :json)
end
