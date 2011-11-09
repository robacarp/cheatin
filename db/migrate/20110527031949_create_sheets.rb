class CreateSheets < ActiveRecord::Migration
  def self.up
    create_table :sheets do |t|
      t.string  :title
      t.text    :content
      t.integer :user_id
      t.string  :language
      t.boolean :is_markdown

      t.timestamps
    end
  end

  def self.down
    drop_table :sheets
  end

end
