class Feature < ActiveRecord::Base
  
  include ToSlug
  
  validates_presence_of :title, :allow_blank => false
  
  belongs_to :user
  has_many :scenarios
  
  def to_param
    "#{id}-#{sluggify(title)}"
  end
  
end
