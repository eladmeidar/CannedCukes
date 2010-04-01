class Scenario < ActiveRecord::Base
  
  validates_presence_of :title, :body
  
  belongs_to :feature
end
