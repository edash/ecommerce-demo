require "spec_helper.rb"

feature "Purchase item" do
  context "User is logged in" do
    before do
      login_default_user
    end

    # NB Having such a long example across multiple pages
    # is not best practice but not having access to the backend
    # means I have to do it solely via the UI

    # The user has to click on "Proceed to checkout" on each page
    # in the purchase flow to progress.

    it "can purchase item by bank wire" do
      # skip to item 1 page for now
      # TODO - add item from home page
      visit "/index.php?id_product=1&controller=product"
      click_on "Add to cart"

      # go to cart summary page
      click_on "Proceed to checkout"

      # go to address page
      click_on "Proceed to checkout"

      # go to shipping
      click_on "Proceed to checkout"

      # agree to terms of service using checkbox with an id of "cgv"
      check("cgv", visible: :all)

      # go to payment page from shipping page
      click_on "Proceed to checkout"

      click_on "Pay by bank wire"
      click_on "I confirm my order"

      expect(page).to have_content "Your order on My Store is complete."

      # TODO: expect assertion to check that correct item is in cart
      # (can check amount is correct)

      # TODO: go to order page and check item is in order history as pending order
      # use within #order-list
      # first class row (first_item)
    end
    # TODO: look at resizing - loses columns at mobile width!!
  end

  # TODO
  context "Guest user" do
    xit "can purchase item by bank wire" do
    end
  end
end
