class InstantLoginMigration < ActiveRecord::Migration
  def change
    add_column :users, :instant_login_token, :string
    add_column :users, :instant_login_token_created_at, :string

    add_index :users, :instant_login_token, unique: true
  end
end
