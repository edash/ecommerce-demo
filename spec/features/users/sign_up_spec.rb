require "spec_helper"
require "./spec/factories/users.rb"
require "./app/user.rb"

feature "Sign up" do
  #use FactoryBot to build a user with personal details
  let(:user) { FactoryBot.build(:user) }

  before do
    visit "/index.php?controller=authentication"
  end

  it "authentication page loads" do
    expect(page).to have_content "Authentication"
  end

  #TODO - better way of describing this?
  context "can check email address isn't taken" do
    it "can do first step of sign up with email address" do
      fill_in "email_create", with: user.email
      click_button "Create an account"
      expect(page).to have_content "YOUR PERSONAL INFORMATION"
      # have to use full path rather than relative because by default '#account-creation' is ignored
      expect(page).to have_current_path "http://automationpractice.com/index.php?controller=authentication#account-creation"
    end
  end

  # Have to test more than one view as /index.php?controller=authentication#account-creation
  # takes you to authentication "frontpage" view
  context "can sign up" do
    it "can fill in form with required fields only" do
      fill_in "email_create", with: user.email
      click_button "Create an account"
      #goes to account creation page
      fill_in "customer_firstname", with: user.first_name
      fill_in "customer_lastname", with: user.last_name
      fill_in "passwd", with: user.password
      fill_in "firstname", with: user.first_name
      fill_in "lastname", with: user.last_name
      fill_in "address1", with: user.street_address
      fill_in "city", with: user.city
      # Use visible: :all to find hidden select box
      find("#id_state", visible: :all).select("#{user.state}")
      fill_in "postcode", with: user.postcode
      fill_in "phone_mobile", with: user.phone
      binding.pry
      click_button "Register"
      expect(page).to have_current_path "http://automationpractice.com/index.php?controller=my-account"
      expect(page).to have_content "Sign out"
    end
  end

  context "can't sign up" do
    it "can't sign up when no email address is given" do
      click_button "Create an account"
      expect(page).to have_content "Invalid email address"
    end

    it "can't sign up when email address is already registered" do
      fill_in "email_create", with: "jane@gmail.com"
      click_button "Create an account"
      expect(page).to have_content "An account using this email address has already been registered. Please enter a valid password or request a new one."
    end
  end
end
