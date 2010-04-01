class MarketSymbol < ActiveRecord::Base
  
  ## Example to an API response:
  #"symbol"=>{"created_at"=>"2009-07-10T21:21:14Z", "title"=>"Google Inc.", "symbol"=>"GOOG", "updated_at"=>"2010-03-30T16:24:11Z", "id"=>2044, "exchange"=>"NASDAQ", "sector"=>"Technology", "industry"=>"Internet Information Providers"}}
  
  validates_presence_of :stocktwits_id, :mark
  has_many :periodical_samples
  
  def self.api
    @stocktwits_user ||= StocktwitUser.new.stocktwits
  end
  
  def MarketSymbol.pull
    if MarketSymbol.count == 0
      @twits = MarketSymbol.api.get('/streams/all')['messages']
    else
      last_id = MarketSymbol.last.stocktwits_id
      @twits = MarketSymbol.api.get("/streams/all?since=#{last_id}")
    end
    
    @twits.each do |message|
      twit = message['message']
      # TODO: clean end of sentence - .-_
    end
  end
end
