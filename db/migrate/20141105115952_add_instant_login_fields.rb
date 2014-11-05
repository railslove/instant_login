class AddInstantLoginFields < ActiveRecord::Migration
  def change
    add_column InstantLogin.config.user_table, :instant_login_token, :string
    add_column InstantLogin.config.user_table, :instant_login_token_created_at, :datetime
  end
end
