require "spec_helper"

feature "Add item to cart" do
  before do
    # Hardcoding for now
    visit "/index.php?id_product=1&controller=product"
  end

  context "add item from item page" do
    it "can add item with default values to cart" do
      click_button "Add to cart"
      expect(page).to have_content "Product successfully added to your shopping cart"
    end
  end

  it "can add item and go to checkout" do
    click_button "Add to cart"
    # Element is styled to look a button, but is actually a link
    click_link "Proceed to checkout"
    expect(page).to have_content "SHOPPING-CART SUMMARY"
  end
end
