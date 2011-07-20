class AddIsMarkdownToSheets < ActiveRecord::Migration
  def self.up
    add_column :sheets, :is_markdown, :boolean
  end

  def self.down
    remove_column :sheets, :is_markdown
  end
end
