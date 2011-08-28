class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :nickname
      t.string   :email
      t.boolean  :admin
      t.string   :password_hash
      t.string   :salt

      t.datetime :created_at
      t.datetime :updated_at

      t.integer  :num_logins, :default => 0
      t.datetime :session_started_at
      t.integer  :score, :default => 0
    end
  end

  def self.down
    drop_table :users
  end
end
