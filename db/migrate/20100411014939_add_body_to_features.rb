class AddBodyToFeatures < ActiveRecord::Migration
  def self.up
    add_column :features, :body, :text
  end

  def self.down
    remove_column :features, :body
  end
end
