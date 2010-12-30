require 'admin/shipments_controller'

Admin::ShipmentsController.class_eval do

  private
  def build_object
    puts "BUILDING"
    @object ||= end_of_association_chain.send parent? ? :build : :new
    @object.address ||= @order.ship_address
    @object.address ||= Address.new(:country_id => Spree::Config[:default_country_id])
    @object.shipping_method ||= @order.shipping_method
    @object.attributes = object_params
    @object
  end

end
