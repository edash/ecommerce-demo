require "spec_helper"

feature "Home page" do
  describe "Home page" do
    before do
      visit "/"
    end

    context "When user is either logged in or out" do
        it "can see home contents" do
        expect(page).to have_title "My Store"
        expect(page).to have_content "POPULAR"
        expect(page).to have_content "BEST SELLERS"
      end
    end
  end
end