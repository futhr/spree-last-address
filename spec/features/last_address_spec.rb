require 'spec_helper'

feature "Last Address" do
  stub_authorization!

  let!(:user) { create(:user) }  
  given!(:mug) { create(:product, name: "Rails Mug") }

  background do

    add_mug_to_cart
    click_button "Checkout"

    sign_in_as!(user)

    Spree::Order.last.update_column(:email, "ryan@spreecommerce.com")

    # Fill in bill address info
    bill_address = "order_bill_address_attributes"
    fill_in_address bill_address

    # Fill in ship address info
    ship_address = "order_ship_address_attributes"
    fill_in_address ship_address

    click_button "Save and Continue"
  end

  context "visit address again,", js: true do
    
    scenario "shows the last saved address info" do
      add_mug_to_cart
      click_button "Checkout"
      # Check the bill address values whether it is equal with last saved values
      bill_address = "order_bill_address_attributes"
      check_address_info bill_address
      
      # Check the ship address values whether it is equal with last saved values
      ship_address = "order_ship_address_attributes"
      check_address_info ship_address

    end
  end

  def fill_in_address(address)
    fill_in "#{address}_lastname",   with: "Reed"
    fill_in "#{address}_firstname",  with: "Kevin"
    fill_in "#{address}_address1",   with: "32390 Ericka Shoals"
    fill_in "#{address}_address2",   with: "Suite 054"
    fill_in "#{address}_city",       with: "South Edgarfurt"
    fill_in "#{address}_zipcode",        with: "16804"
    fill_in "#{address}_phone",      with: "525.312.6935"

    country_css      = "#{address}_country_id"
    state_select_css = "#{address}_state_id"
    state_name_css   = "#{address}_state_name"

    select "United States of America",  from: country_css
    select "Alabama",  from: state_select_css
    
  end

  def check_address_info(address)
    find( "##{address}_lastname")["value"].   should eql "Reed"
    find( "##{address}_firstname")["value"].  should eql "Kevin"
    find( "##{address}_address1")["value"].   should eql "32390 Ericka Shoals"
    find( "##{address}_address2")["value"].   should eql "Suite 054"
    find( "##{address}_city")["value"].       should eql "South Edgarfurt"
    find( "##{address}_zipcode")["value"].        should eql "16804"
    find( "##{address}_phone")["value"].      should eql "525.312.6935"

    country_css      = "#{address}_country_id"
    state_select_css = "#{address}_state_id"

    find_field(country_css).value.should eql "1"
  end

  def add_mug_to_cart
    visit spree.root_path
    save_and_open_page
    click_link mug.name
    click_button "Add To Cart"
  end

  def sign_in_as!(user)
    find("#spree_user_email").set(user.email)
    fill_in 'Password', with: 'secret'
    click_button 'Login'
  end
end