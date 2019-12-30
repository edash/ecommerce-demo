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
    # Use pre-existing user and custom method defined below
    login("lupe_howell@jacobsonnolan.info", "password1")
    expect(page).to have_content "Sign out"
    expect(page).to have_css(".logout")
    expect(page).to have_content("Kelsie Bogan")
  end

  context "can't log in with missing or invalid credentials" do
    it "can't log in without enetering an email address" do
      click_button "Sign in"
      expect(page).to have_content "An email address required."
    end

    it "can't log in with unregistered email address" do
      login("notregistered@foo.com", "password")
      expect(page).to have_content "Authentication failed."
    end

    it "can't log in with correct email but no password" do
      login("lupe_howell@jacobsonnolan.info", "")
      expect(page).to have_content "Password is required."
    end

    it "can't log in with wrong password" do
      login("lupe_howell@jacobsonnolan.info", "wrongpassword")
      expect(page).to have_content "Authentication failed."
    end
  end
end

#helper method to log in
def login(email, password)
  # Use css to find correct email address field input
  # because there are two email address fields on the page
  # and 'within' block doesn't work here
  email_field = find(:css, "input[id$='email']")
  email_field.fill_in with: email
  fill_in "passwd", with: password
  click_button "Sign in"
end
