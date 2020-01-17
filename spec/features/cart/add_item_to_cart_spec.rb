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

  it "can add item and see it on cart summary page" do
    click_button "Add to cart"
    # Element is styled to look a button, but is actually a link
    click_link "Proceed to checkout"
    expect(page).to have_content "SHOPPING-CART SUMMARY"
    # check in summary table for the specfic item
    expect(page).to have_css("#cart_summary > tbody > tr.first_item > td.cart_description > p.product-name",
                             text: "Faded Short Sleeve T-shirts")
  end
end
