class ApiClient
  def initialize(params)
    @params = params
    @conn = Faraday.new(
      url: 'https://staging-gtw.seraphin.be',
      headers: {'Content-Type' => 'application/json', 'X-Api-Key' => ENV['KEY']}
    )
  end

  def quote
    response = @conn.post('/quotes/professional-liability') do |req|
      req.body = @params.to_json
    end
    JSON.parse(response.body)
  end
end
