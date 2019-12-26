require 'spec_helper'

feature 'Log in' do
  before do
    visit '/index.php?controller=authentication'
  end

  it 'authentication page loads' do
    expect(page).to have_content 'Authentication'  
  end

  # TODO use faker? have to hardcode user in for now
  it 'can log in with valid name and password' do
    # "email" is ambiguous so find it within the login form
    within('#login_form') do
      fill_in 'email', with: "edashfield+test@gmail.com"
      fill_in 'passwd', with: "password"
      click_button "Sign in"
    end
    expect(page).to have_content "Sign out"
    expect(page).to have_css(".logout")
  end

  # TODO
  context "can't log in with invalid credentials" do
   it "can't log in with blank fields"
   it "can't log in with unregistered email address"
   it "can't log in with wrong password"
  end
  
    # TODO 
    context "when user is logged out" do
      xit "can see log in option" do
        # .login "Sign in"
      end
    end

end