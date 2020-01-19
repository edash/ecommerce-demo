require "spec_helper"

feature "Add item to cart" do
  before do
    # Hardcoding address for Faded Short Sleeve T-shirts for now
    visit "/index.php?id_product=1&controller=product"
  end

  # TODO: do I need context block?
  context "add item from item page" do
    it "with default quantity and size" do
      click_on "Add to cart"

      expect(page).to have_content "Product successfully added to your shopping cart"
    end

    it "can see item on cart summary page" do
      click_on "Add to cart"
      click_on "Proceed to checkout"

      expect(page).to have_content "SHOPPING-CART SUMMARY"
      expect(page).to have_content("Faded Short Sleeve T-shirts")
    end
  end
end
