require "spec_helper"

module LoginHelper
  # helper method to log in
  def login(email, password)
    # Use css to find correct email address field input
    # because there are two email address fields on the page
    # and 'within' block doesn't work here
    email_field = find(:css, "input[id$='email']")
    email_field.fill_in with: email
    fill_in "passwd", with: password
    click_button "Sign in"
  end
end
