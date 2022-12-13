class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @quote = Quote.new
    quote_params = {
      "annualRevenue": params[:annual_revenue].to_i,
      "enterpriseNumber": params[:enterprise_number],
      "legalName": params[:legal_name],
      "naturalPerson": params[:natural_person].to_i == 1,
      "nacebelCodes": QuoteReader.new(params[:profession]).codes
    }
    @quote = ApiClient.new(quote_params).quote

    # if @quote.dig("success")
    #   Simulation.create(user: current_user, url: request.original_url)
    # end
  end
end
