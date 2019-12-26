require "spec_helper"

feature "Home page" do
  describe "Home page" do
    before do
      visit "/"
    end

    context "When user is either logged in or out" do
      it "can see home contents" do
        expect(page).to have_content "BEST SELLERS"
      end
    end

    # TODO
      context "When user is logged out" do
        xit "can see log in option" do
          # .login "Sign in"
        end
      end

    # TODO
    context "When user is logged in" do
      xit "can see log out option" do
        # .logout "Sign out"

      end
    end
  end
end