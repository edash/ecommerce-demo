require "spec_helper"

feature "Home page" do
  describe "Home page" do
    before do
      visit "/"
    end

    context "When user is either logged in or out" do
      # TODO add more content ? 
      it "can see home contents" do
        expect(page).to have_content "BEST SELLERS"
      end
    end

  end
end