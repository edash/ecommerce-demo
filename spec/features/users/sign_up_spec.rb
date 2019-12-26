require "spec_helper"
require "./spec/factories/users.rb"
require "./app/user.rb"

feature "Sign up" do
  let(:user) { FactoryBot.build(:user) }
  before do
    visit "/index.php?controller=authentication"
  end

  it "authentication page loads" do
    expect(page).to have_content "Authentication"
  end

  context "can sign up successfully" do
    it "can do first step of sign up with email address" do
      fill_in "email_create", with: user.email
      click_button "Create an account"
      expect(page).to have_content "YOUR PERSONAL INFORMATION"
      # have to use full path rather than relative because by default '#account-creation' is ignored
      expect(page).to have_current_path "http://automationpractice.com/index.php?controller=authentication#account-creation"
    end

    #TODO
    xit "can fill in form successfully" do
    end
  end

  context "can't sign up" do
    it "can't sign up with no email address is given" do
      click_button "Create an account"
      expect(page).to have_content "Invalid email address"
    end

    it "can't sign up when email address is taken" do
      fill_in "email_create", with: "jane@gmail.com"
      click_button "Create an account"
      expect(page).to have_content "An account using this email address has already been registered. Please enter a valid password or request a new one."
    end
  end
end
