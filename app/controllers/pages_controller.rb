class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @quote = Quote.new
    @simulations = Simulation.where(user: current_user)
    raise
    if request.original_fullpath.include?("annual_revenue")
      if (QuoteReader.new(params[:profession]).codes - QuoteReader.new("medical").codes).count < QuoteReader.new("medical").codes.count
        @ded_formula = "small"
        @cov_formula = "large"
      else
        @ded_formula = "medium"
        @cov_formula = "small"
      end
      codes = []
      QuoteReader.new(params[:profession]).codes.each do |code|
        code = code + "0" until code.size == 5
        codes << code
      end
      quote_params = {
        "annualRevenue": params[:annual_revenue].to_i,
        "enterpriseNumber": params[:enterprise_number],
        "legalName": params[:legal_name],
        "naturalPerson": params[:natural_person].to_i == 1,
        "nacebelCodes": codes,
        "deductibleFormula": @ded_formula,
        "coverageCeilingFormula": @cov_formula
      }
      @quote = ApiClient.new(quote_params).quote
      if @quote["success"] && Simulation.where(user: current_user, url: request.original_url).count.zero?
        Simulation.create(user: current_user, url: request.original_url)
      end
    end
  end
end
