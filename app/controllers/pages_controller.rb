class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @quote = Quote.new
    if request.original_fullpath.include?("annual_revenue")
      quote_params = {
        "annualRevenue": params[:annual_revenue].to_i,
        "enterpriseNumber": params[:enterprise_number],
        "legalName": params[:legal_name],
        "naturalPerson": params[:natural_person].to_i == 1,
        "nacebelCodes": QuoteReader.new(params[:profession]).codes
      }
      @quote = ApiClient.new(quote_params).quote

      if @quote["success"] && Simulation.where(user: current_user, url: request.original_url).count.zero?
        Simulation.create(user: current_user, url: request.original_url)
      end
    end
  end
end
