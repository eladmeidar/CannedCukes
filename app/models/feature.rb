class Feature < ActiveRecord::Base
  
  include ToSlug
  
  validates_presence_of :title, :allow_blank => false
  
  belongs_to :user
  
  def scenarios
    3
  end
  
  def to_param
    "#{id}-#{sluggify(title)}"
  end
  
end
