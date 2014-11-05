class AddInstantLoginFields < ActiveRecord::Migration
  def change
    add_column :users, :instant_login_token, :string
    add_column :users, :instant_login_token_created_at, :datetime
  end
end
