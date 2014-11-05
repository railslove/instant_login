class SessionsController < ApplicationController
  def instant_success
    render text: 'Custom instant login success'
  end

  def instant_failure
    render text: 'Custom instant login failure'
  end
end
