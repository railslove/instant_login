require 'rails_helper'

RSpec.feature 'Custom user signs in via instant login link', type: :feature  do
  let(:user) { User.create(email: 'test@example.org', password: 'secret') }

  around(:each) do |example|
    InstantLogin.configure do |config|
      config.success_path = '/sessions/instant_success'
      config.failure_path = '/sessions/instant_failure'
    end

    begin
      example.run
    ensure
      InstantLogin.reset_configuration!
    end
  end

  scenario 'User enters an invalid email' do
    visit '/'
    fill_in 'email', with: 'invalid@email.org'
    click_button 'Instant login'
    expect(page).to have_content('User not found')
  end

  scenario 'User provides an invalid login token' do
    visit '/instant_login/invalid-token'
    expect(page).to have_content('Custom instant login failure')
  end

  scenario 'User tries an outdated login token' do
    visit '/'
    fill_in 'email', with: user.email
    click_button 'Instant login'

    # Move token back in time
    user.update(instant_login_token_created_at: 20.minutes.ago)

    # Login
    visit "/instant_login/#{user.reload.instant_login_token}"
    expect(page).to have_content('Custom instant login failure')
  end

  scenario 'User tries a login token twice' do
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
    expect(page).to have_content('Custom instant login success')

    visit match[:url]
    expect(page).to have_content('Custom instant login failure')
  end

  scenario 'User performs a successful login' do
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
    expect(page).to have_content('Custom instant login success')
  end
end
