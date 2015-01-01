RSpec.feature 'Last Address', :js do
  stub_authorization!

  given!(:user) { create(:user) }
  given!(:product) { create(:product) }
  given(:address) { build(:address) }

  background do
    add_product_to_cart
    click_button 'Checkout'

    sign_in_as! user

    Spree::Order.last.update_column(:email, user.email)

    fill_in_address 'bill'
    uncheck 'order_use_billing'
    fill_in_address 'ship'

    click_button 'Save and Continue'
  end

  context 'visit address again,' do
    scenario 'shows the last saved address info' do
      add_product_to_cart
      click_button 'Checkout'

      check_address_info 'bill'
      uncheck 'order_use_billing'
      check_address_info 'ship'
    end
  end

  def fill_in_address(kind)
    addr = "order_#{kind}_address_attributes_"
    fill_in "#{addr}lastname",  with: address.firstname
    fill_in "#{addr}firstname", with: address.lastname
    fill_in "#{addr}address1",  with: address.address1
    fill_in "#{addr}address2",  with: address.address2
    fill_in "#{addr}city",      with: address.city
    fill_in "#{addr}zipcode",   with: address.zipcode
    fill_in "#{addr}phone",     with: address.phone
    select 'United States of America', from: "#{addr}country_id"
    select 'Alabama', from: "#{addr}state_id", match: :first
  end

  def check_address_info(kind)
    addr = "order_#{kind}_address_attributes_"
    expect(find("##{addr}lastname")['value']).to eq address.firstname
    expect(find("##{addr}firstname")['value']).to eq address.lastname
    expect(find("##{addr}address1")['value']).to eq address.address1
    expect(find("##{addr}address2")['value']).to eq address.address2
    expect(find("##{addr}city")['value']).to eq address.city
    expect(find("##{addr}zipcode")['value']).to eq address.zipcode
    expect(find("##{addr}phone")['value']).to eq address.phone
    expect(find_field("#{addr}country_id").value).to eq '1'
  end

  def add_product_to_cart
    visit spree.root_path
    click_link product.name
    click_button 'add-to-cart-button'
  end

  def sign_in_as!(user)
    fill_in 'spree_user_email', with: user.email
    fill_in 'spree_user_password', with: 'secret'
    click_button 'Login'
  end
end
