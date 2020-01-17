require "spec_helper.rb"

feature "Purchase item" do

  #TODO context - user already logged in -> move login to before block

  before do
    # go to log in page
    visit "/index.php?controller=authentication" #TODO - remove this line as in login helper
  end
  # log in

  # TODO - more whitespace
  # TODO- look at click_on

  # NB Having such a long example across multiple pages
  # is not best practice but not having access to the backend
  # means I have to do it solely via the UI

  it "can purchase item when user is logged in" do
    # log in

    #TODO use example.com

    login("lupe_howell@jacobsonnolan.info", "password1")
    # put in cart - skip to item 1 page for now
    # TODO - add item from home page
    visit "/index.php?id_product=1&controller=product"
    click_button "Add to cart"
    # go to cart summary page from item page
    # element is styled to look a button, but is actually a link
    click_link "Proceed to checkout"
    # go to address page from cart summary page
    click_link "Proceed to checkout"
    # go to shipping from address page
    # this element is a button
    click_button "Proceed to checkout"
    # agree to terms of service - the checkbox with an id of "cgv" is hidden
    check("cgv", visible: :all)
    # go to payment page from shipping page
    click_button "Proceed to checkout"
    # select pagement option and go to order summary page
    click_link "Pay by bank wire"
    # confirm order
    click_button "I confirm my order"
    expect(page).to have_content "Your order on My Store is complete."

    # TODO expect assertion to check that correct item is in cart (can check amount is correct)

    # TODO go to order page and check item is in order history as pending order
    # use within #order-list
    # first class row (first_item)

    # TODO look at resizing - loses columns at mobile width!!
  end
end
