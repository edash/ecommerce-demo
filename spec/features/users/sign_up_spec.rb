require "spec_helper"
require "./spec/factories/users.rb"
require "./app/model/user.rb"

feature "Sign up" do
  let(:user) { FactoryBot.build(:user) }

  before do
    visit "/index.php?controller=authentication"
  end

  it "authentication page loads" do
    expect(page).to have_content "Authentication"
  end

  describe "successful sign up" do
    # TODO: - better way of describing this?
    it "can do first step of sign up with email address" do
      fill_in "email_create", with: user.email
      click_button "Create an account"

      expect(page).to have_content "YOUR PERSONAL INFORMATION"
      # have to use full path because by default '#account-creation' is ignored
      expect(page).to have_current_path "http://automationpractice.com/index.php?controller=authentication#account-creation"
    end

    # Have to test more than one view as /index.php?controller=authentication#account-creation
    # takes you to authentication "frontpage" view
    it "with required details only" do
      fill_in "email_create", with: user.email
      click_on "Create an account"

      # on account creation page
      fill_in "customer_firstname", with: user.first_name
      fill_in "customer_lastname", with: user.last_name
      fill_in "passwd", with: user.password
      fill_in "firstname", with: user.first_name
      fill_in "lastname", with: user.last_name
      fill_in "address1", with: user.street_address
      fill_in "city", with: user.city

      # Use visible: :all to find hidden select box
      find("#id_state", visible: :all).select(user.state.to_s)
      fill_in "postcode", with: user.postcode
      fill_in "phone_mobile", with: user.phone
      click_on "Register"

      expect(page).to have_current_path "http://automationpractice.com/index.php?controller=my-account"
      expect(page).to have_content "Sign out"
      expect(page).to have_content "#{user.first_name} #{user.last_name}"
    end
  end

  # Test sad paths
  describe "unsuccessful sign up" do
    it "when no email address is given" do
      click_on "Create an account"

      expect(page).to have_content "Invalid email address"
    end

    it "when email address is already registered" do
      fill_in "email_create", with: "user@example.com"
      click_on "Create an account"

      expect(page).to have_content "An account using this email address has already been registered. Please enter a valid password or request a new one."
    end

    it "when required details are not entered" do
      fill_in "email_create", with: user.email
      click_on "Create an account"
      click_on "Register"

      expect(page).to have_content "There are 8 errors"
      expect(page).to have_content "You must register at least one phone number."
      expect(page).to have_content "lastname is required."
      expect(page).to have_content "firstname is required."
      expect(page).to have_content "passwd is required."
      expect(page).to have_content "address1 is required."
      expect(page).to have_content "city is required."
      expect(page).to have_content "The Zip/Postal code you've entered is invalid. It must follow this format: 00000"
      expect(page).to have_content "This country requires you to choose a State."
    end
  end
end
