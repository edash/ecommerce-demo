require 'spec_helper'

feature 'Log in' do
  before do
    visit '/index.php?controller=authentication'
  end

  it 'authentication page loads' do
    expect(page).to have_content('Authentication')
  end

  # have to hardcode user in for now
  it 'can log in with valid name and password' do
    # login_form
  end
end