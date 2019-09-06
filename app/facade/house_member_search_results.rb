class HouseMemberSearchResults
  def initialize(house)
    @house = house
  end

  def member_count
    member.count
  end

  def member
    conn = Faraday.new(url: "http://westerosapi.herokuapp.com") do |faraday|
      faraday.params["api-key"] = ENV['WESTEROS_API_KEY']
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/api/v1/house/#{house}")

  end


  private
  attr_reader :house
end
