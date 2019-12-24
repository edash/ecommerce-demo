require "spec_helper"

feature "Home page" do
  describe "Home page" do
    context "When user is logged out" do
      before do
        visit "/"
      end

      it "can see home contents" do
        expect(page).to have_content "BEST SELLERS"
      end


      context "When user is logged out" do
      end
    end
  end
end