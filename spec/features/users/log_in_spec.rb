require 'spec_helper'

feature 'Log in' do
  before do
    visit '/index.php?controller=authentication'
  end

  it 'authentication page loads' do
    expect(page).to have_content 'Authentication'
  end

  # TODO add real user - have to hardcode user in for now
  xit 'can log in with valid name and password' do
    # "email" is ambiguous so find it within the login form
    within('#login_form') do
      fill_in 'email', with: "email@email.com"
      fill_in 'passwd', with: "password"
      click_button "Sign in"
    end
    #assert user is logged in
    
  end

  # TODO
  context "can't log in with invalid credentials" do
   it "can't log in with blank fields"
   it "can't log in with unregistered email address"
   it "can't log in with wrong password"
  end


end