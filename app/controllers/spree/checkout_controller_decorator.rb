module Spree
  CheckoutController.class_eval do

  private

    def before_address
      return if @order.bill_address or @order.ship_address
      last_used_bill_address, last_used_ship_address = SpreeLastAddress.find_last_used_addresses(@order.email)
      preferred_bill_address, preferred_ship_address = spree_current_user.bill_address, spree_current_user.ship_address if spree_current_user.respond_to?(:bill_address) && spree_current_user.respond_to?(:ship_address)
      @order.bill_address ||= preferred_bill_address || last_used_bill_address || Address.default
      @order.ship_address ||= preferred_ship_address || last_used_ship_address || Address.default
    end

  end
end
