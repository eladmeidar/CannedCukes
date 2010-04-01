module ToSlug
  
  def self.included(base)
    base.class_eval do
      include InstanceMethods
    end
  end
  
  # Generate a slug for the string +value+.
  #
  # A slug should consist of numbers (0-9), lowercase letters (a-z) and
  # dashes (-). Any other characters should be filtered.
  #
  # ==== Example
  #
  # "The World is Beautiful!".to_slug # => "the-world-is-beautiful"
  #
  # ==== Returns
  # String:: A 'sluggified' version of this string
  #
  # --
  # @api public
  
  module InstanceMethods
    
    protected
    def sluggify(attribute_value)
      # Perform transliteration to replace non-ascii characters with an ascii
      # character
      value = attribute_value.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
    
      # Remove single quotes from input
      value.gsub!(/[']+/, '')
 
      # Replace any non-word character (\W) with a space
      value.gsub!(/\W+/, ' ')
    
      # Remove any whitespace before and after the string
      value.strip!
    
      # All characters should be downcased
      value.downcase!
    
      # Replace spaces with dashes
      value.gsub!(' ', '-')
    
      # Return the resulting slug
      value
    end
  end
  
end