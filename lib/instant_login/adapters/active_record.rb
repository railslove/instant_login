require 'active_support/concern'
require 'securerandom'
module InstantLogin
  module Adapters
    module ActiveRecord
      module Setup
        def uses_instant_login!
          self.send(:include, Methods)
        end
      end

      module Methods
        extend ActiveSupport::Concern
        included do
          scope :valid_tokens, -> { where('instant_login_token_created_at >= ?', 15.minutes.ago) }
        end

        def generate_instant_login_token
          update(instant_login_token: SecureRandom.uuid, instant_login_token_created_at: Time.now)
        end

        def reset_instant_login
          update(instant_login_token: nil, instant_login_token_created_at: nil)
        end

        module ClassMethods
          def authenticate_with_instant_login_token(token)
            valid_tokens.find_by(instant_login_token: token).tap do |user|
              user.reset_instant_login unless user.nil?
            end
          end
        end
      end
    end
  end
end
