class Feature < ActiveRecord::Base
  
  include ToSlug
  
  validates_presence_of :title, :allow_blank => false
  validates_uniqueness_of :title, :scope => 'user_id'
  belongs_to :user
  has_many :scenarios
  
  accepts_nested_attributes_for :scenarios
  
  def to_param
    "#{id}-#{sluggify(title)}"
  end
  
  def updated_at_in_epoch
    updated_at.to_i
  end
  
end
