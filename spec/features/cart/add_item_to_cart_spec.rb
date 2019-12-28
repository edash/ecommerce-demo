require "spec_helper"

feature "Add item to cart" do
  context "Add item from item page" do
    before do
      visit "/index.php?id_product=1&controller=product"
    end

    it "can add item with default values to cart" do
      click_button "Add to cart"
      expect(page).to have_content "Product successfully added to your shopping cart"
      expect(page).to have_content "Continue shopping"
      expect(page).to have_content "Proceed to checkout"
    end
  end
end
