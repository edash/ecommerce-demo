require "spec_helper"

module LoginHelper
  def login(email, password)
    visit "/index.php?controller=authentication"
    # Look within login form for correct email address field as page has 2
    within "#login_form" do
      fill_in "Email address", with: email
      fill_in "Password", with: password
      click_on "Sign in"
    end
  end

  def login_default_user
    login("user@example.com", "password")
  end
end
