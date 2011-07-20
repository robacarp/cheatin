class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags, :primary_key => :tag_id do |t|
      t.integer :tag_id
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :tags
  end
end
