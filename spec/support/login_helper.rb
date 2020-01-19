require "spec_helper"

module LoginHelper
  def login(email, password)
    visit "/index.php?controller=authentication"
    # Look within login form to find correct email address field as page has 2
    within "#login_form" do
      fill_in "Email address", with: email
      fill_in "Password", with: password
    end
    click_button "Sign in"
  end

  def login_default_user
    login("user@example.com", "password")
  end
end
