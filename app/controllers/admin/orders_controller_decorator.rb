require "rails/all"
require 'resource_controller'

require 'admin/orders_controller'
require 'find_address'

Admin::OrdersController.class_eval do
  before_filter :fix_addresses, :only => [:update]

  def fix_addresses
    if !@order.line_items.empty?
      unless @order.complete?
        if params[:order].key?(:email) and params[:order].key?(:bill_address_attributes) and
           params[:order][:bill_address_attributes][:city] == ""
          puts "ORDERS CALLED -#{params[:order][:bill_address_attributes]}"
          bill_address , ship_address = FindAddressHelper.find_address(params[:order][:email])
          return unless bill_address 
          puts "Setting Bill to #{bill_address}"
          FindAddressHelper.set_params(params[:order][:bill_address_attributes] , bill_address)
          FindAddressHelper.set_params(params[:order][:ship_address_attributes] , ship_address)
        end
      end
    end
  end
end
