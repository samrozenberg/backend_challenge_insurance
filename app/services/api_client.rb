class ApiClient
  def initialize(params)
    @params = params
    @connection = Faraday.new(
      url: 'https://staging-gtw.seraphin.be',
      headers: { 'Content-Type' => 'application/json', 'X-Api-Key' => ENV['KEY'] }
    )
  end

  def quote
    response = @connection.post('/quotes/professional-liability') do |request|
      request.body = @params.to_json
    end
    JSON.parse(response.body)
  end
end
