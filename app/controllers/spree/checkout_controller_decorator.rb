module Spree
  CheckoutController.class_eval do

    private

    def before_address
      return if @order.bill_address || @order.ship_address

      last_used_bill_address, last_used_ship_address = find_last_used_addresses(@order.email)

      if spree_current_user.respond_to?(:bill_address) && spree_current_user.respond_to?(:ship_address)
        preferred_bill_address, preferred_ship_address = spree_current_user.bill_address, spree_current_user.ship_address
      end

      @order.bill_address ||= preferred_bill_address || last_used_bill_address || Address.default
      @order.ship_address ||= preferred_ship_address || last_used_ship_address || Address.default
    end

    def find_last_used_addresses(email)
      past = Spree::Order.order(id: :desc).where(email: email).where.not(state: 'cart').limit(8)
      if (order = past.find(&:bill_address))
        bill_address = order.bill_address.clone if order.bill_address
        ship_address = order.ship_address.clone if order.ship_address
      end
      [bill_address, ship_address]
    end
  end
end
