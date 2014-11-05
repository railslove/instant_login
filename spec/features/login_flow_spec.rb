require 'rails_helper'

RSpec.feature 'User signs in via instant login link', type: :feature  do

  scenario 'User enters an invalid email'

  scenario 'User provides an invalid login token'

  scenario 'User tries an outdated login token'

  scenario 'User tries a login token twice'

  scenario 'User performs a successful login' do
    user = User.create email: 'test@example.org', password: 'secret'

    # Initiate login
    visit '/'
    fill_in 'email', with: user.email
    click_button 'Instant login'

    # Email
    email = ActionMailer::Base.deliveries.last.body.raw_source
    match = email.match %r[(?<url>http://example.org/instant_login/.+$)]

    # Perform login
    visit match[:url]

    # Check that logged in
    expect(page).to have_content('Logged in')
  end
end
