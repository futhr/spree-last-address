RSpec.describe Spree::CheckoutController, type: :controller do
  stub_authorization!

  let(:token) { 'some_token' }
  let(:user)  { create(:user, email: 'ryan@example.com') }
  let(:order) { create(:order_with_totals) }

  let(:address_params) do
    address = build(:address)
    address.attributes.except('created_at', 'updated_at')
  end

  before do
    allow(controller).to receive(:spree_current_user) { user }
    allow(controller).to receive(:current_order) { order }
  end

  context '#before_address' do
    it 'returns nil if order.bill_address is not nil' do
      order.bill_address = create(:address)
      spree_get :edit, state: 'address'
      expect(controller.instance_eval { before_address }).to be_nil
    end

    it 'returns nil if order.ship_address is not nil' do
      order.ship_address = create(:address)
      spree_get :edit, state: 'address'
      expect(controller.instance_eval { before_address }).to be_nil
    end

    it 'returns last saved bill_address and ship_address of order' do
      # Save the last address when you visit checkout/delivery.
      spree_post  :update,
                  state: 'address',
                  order: {
                    bill_address_attributes: address_params,
                    use_billing: true
                  }

      # If you visit checkout/address, then last address will be appeared.
      order.bill_address = nil
      order.ship_address = nil
      spree_get :edit, state: 'address'
      controller.instance_eval { before_address }
      expect(order.bill_address).not_to be_nil
    end
  end
end
