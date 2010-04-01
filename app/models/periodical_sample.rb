class PeriodicalSample < ActiveRecord::Base
  
  validates_presence_of :count
  
  belongs_to :market_symbol
end
