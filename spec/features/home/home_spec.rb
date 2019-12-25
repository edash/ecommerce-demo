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

      context "When user is logged out" do
        it "can see log in option"
      end

    context "When user is logged in" do
      it "can see log out option" do
      end
    end
  end
end