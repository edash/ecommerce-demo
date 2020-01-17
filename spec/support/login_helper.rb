require "spec_helper"

module LoginHelper
  # helper method to log in
  def login(email, password)
    # Use css to find correct email address field input
    # because there are two email address fields on the page
    # and 'within' block doesn't work here
    # TODO - change to within block
    visit "/index.php?controller=authentication"
    email_field = find("#email")
    email_field.fill_in with: email
    fill_in "passwd", with: password
    click_button "Sign in"
  end
end
