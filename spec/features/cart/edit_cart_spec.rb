require "spec_helper"

feature "Edit cart" do
  before do
    # log in with valid user
    login("lupe_howell@jacobsonnolan.info", "password1")
    # add "item 1" to cart
    visit "/index.php?id_product=1&controller=product"
    click_button "Add to cart"
    # go to cart summary page
    click_link "Proceed to checkout"
  end

  context "edit cart from cart summary page" do
    xit "can increase item quantity" do
      #Inside the table there's a link to increase the first item's quantity
      # increase_link = find("#cart_summary > tbody > tr.first_item > td.cart_quantity > div.cart_quantity_button > a[href]",
      #                     visible: :all)

      #  increase_link = find("#cart_summary > tbody > tr.first_item > td.cart_quantity > div.cart_quantity_button > a.cart_quantity_up[href='http://automationpractice.com/index.php?controller=cart&amp;add=1&amp;id_product=1&amp;ipa=1&amp;id_address_delivery=252665&amp;token=8d825f76373de1abc964aa5242e801a4']", visible: :all)
      click_link "http://automationpractice.com/index.php?controller=cart&amp;add=1&amp;id_product=1&amp;ipa=1&amp;id_address_delivery=252665&amp;token=8d825f76373de1abc964aa5242e801a4"
      # can't find css
      # increase_link = find("#cart_summary > tbody > tr.first_item > td.cart_quantity > div.cart_quantity_button > a#cart_quantity_up_1_1_0_252665", visible: :all)
      # cart_quantity_up btn btn-default button-plus
      # increase_link.click_link

      binding.pry
      #expect quantity to increase to 2

    end

    xit "can decrease item quantity"
    xit "can remove item from cart"
  end
end
