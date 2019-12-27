require "spec_helper"

feature "Log in" do
  before do
    visit "/index.php?controller=authentication"
  end

  it "authentication page loads" do
    expect(page).to have_content "Authentication"
  end

  it "can log in with valid name and password" do
    # Use pre-existing user
    # "email" is ambiguous so find it within the login form
    within("#login_form") do
      fill_in "email", with: "lupe_howell@jacobsonnolan.info"
      fill_in "passwd", with: "password1"
      click_button "Sign in"
    end
    expect(page).to have_content "Sign out"
    expect(page).to have_css(".logout")
    expect(page).to have_content("Kelsie Bogan")
  end

  context "can't log in with missing or invalid credentials" do
    it "can't log in with no email address" do
      click_button "Sign in"
      expect(page).to have_content "An email address required."
    end

    it "can't log in with unregistered email address" do
      within("#login_form") do
        fill_in "email", with: "notregistered@foo.com"
        fill_in "passwd", with: "password"
        click_button "Sign in"
      end
      expect(page).to have_content "Authentication failed."
    end

    it "can't log in with correct email but no password" do
      within("#login_form") do
        fill_in "email", with: "lupe_howell@jacobsonnolan.info"
        click_button "Sign in"
      end
      expect(page).to have_content "Password is required."
    end

    it "can't log in with wrong password" do
      within("#login_form") do
        fill_in "email", with: "lupe_howell@jacobsonnolan.info"
        fill_in "passwd", with: "wrongpassword"
        click_button "Sign in"
      end
      expect(page).to have_content "Authentication failed."
    end
  end

  context "when user is logged out" do
    it "can see log in option" do
      expect(page).to have_content "Sign in"
      expect(page).to have_css ".login"
    end
  end
end
