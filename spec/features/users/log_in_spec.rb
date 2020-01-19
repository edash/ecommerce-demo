require "spec_helper"

feature "Log in" do
  before do
    # go to log in page
    visit "/index.php?controller=authentication"
  end

  it "log in page loads" do
    expect(page).to have_content "Authentication"
  end

  context "when user is logged out" do
    it "can see log in option" do
      expect(page).to have_content "Sign in"
      expect(page).to have_css ".login"
    end
  end

  it "can log in with valid name and password" do
    # Use pre-existing user and custom method defined in login_helper.rb
    login_default_user

    expect(page).to have_content "Sign out"
    expect(page).to have_css(".logout")
    expect(page).to have_content("Tui Baker")
  end

  context "can't log in with missing or invalid credentials" do
    it "can't log in without entering an email address" do
      click_button "Sign in"

      expect(page).to have_content "An email address required."
    end

    it "can't log in with unregistered email address" do
      login("notregistered@example.com", "password")

      expect(page).to have_content "Authentication failed."
    end

    it "can't log in with correct email but no password" do
      login("user@example.com", "")

      expect(page).to have_content "Password is required."
    end

    it "can't log in with wrong password" do
      login("user@example.com", "wrongpassword")

      expect(page).to have_content "Authentication failed."
    end
  end
end
