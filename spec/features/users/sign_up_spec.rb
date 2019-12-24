require 'spec_helper'

feature 'Sign up' do
  before do
    visit '/index.php?controller=authentication'
  end

  it 'authentication page loads' do
    expect(page).to have_content "Authentication"
  end

  # have to hardcode user in for now
  it 'can do first step of sign up with email address' do
    # enter email - id email_create
    fill_in "email_create", with: "janet@email.com"    
    # select button
    click_button "Create an account"
    # assert
    expect(page).to have_content "YOUR PERSONAL INFORMATION"
  end

  it "can't sign up with no email address" do
    click_button "Create an account"
    expect(page).to have_content "Invalid email address"
    end
  end