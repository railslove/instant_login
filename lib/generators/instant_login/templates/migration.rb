class InstantLoginMigration < ActiveRecord::Migration
  def change
    add_column :<%= model_class_name.tableize %>, :instant_login_token, :string
    add_column :<%= model_class_name.tableize %>, :instant_login_token_created_at, :string

    add_index :<%= model_class_name.tableize %>, :instant_login_token, unique: true
  end
end
