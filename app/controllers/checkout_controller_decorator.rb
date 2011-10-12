require 'find_address'

CheckoutController.class_eval do

  private

  def before_address
    return if @order.bill_address or @order.ship_address
    #puts "BEFORE ADDRESS2 called user= #{@order}  #{@order.email}"
    @order.bill_address , @order.ship_address = FindAddressHelper.find_address(@order.email)
    # in case none found
    @order.bill_address ||= Address.new(:country_id => Spree::Config[:default_country_id])
    @order.ship_address ||= Address.new(:country_id => Spree::Config[:default_country_id])
  end


end
