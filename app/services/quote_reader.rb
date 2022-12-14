require 'csv'

class QuoteReader
  def initialize(query)
    @query = query
  end

  def codes
    return [] unless @query.present?
    CSV.read("NACEBEL_2008.csv", {col_sep: ";"}).select{|i| i[0].to_i == 5 && (i[3] + i[4] + i[5]).include?(@query)}.map{|i| i[1].to_s}
  end

  def countcodes
    CSV.read("NACEBEL_2008.csv", {col_sep: ";"}).select{|i| i[0].to_i == 5}.count
  end
end
