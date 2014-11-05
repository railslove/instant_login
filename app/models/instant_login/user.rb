class InstantLogin::User < ActiveRecord::Base

  self.table_name = "users"

  def generate_instant_login_token

  end

  def self.find_by_instant_login_token

  end
end
