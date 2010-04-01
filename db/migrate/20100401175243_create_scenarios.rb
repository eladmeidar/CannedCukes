class CreateScenarios < ActiveRecord::Migration
  def self.up
    create_table :scenarios do |t|
      t.string :title
      t.text :body
      t.integer :feature_id
      t.timestamps
    end
  end

  def self.down
    drop_table :scenarios
  end
end
