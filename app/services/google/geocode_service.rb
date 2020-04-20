class GeocodeService

  def find_location(location)
    response = connection.get('/maps/api/geocode/json') do |faraday|
      faraday.params['key'] = Figaro.env.google_api_key
      faraday.params['components'] = "locality:#{location}"
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://maps.googleapis.com')
  end
end
