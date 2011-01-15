require 'find_address'

Admin::OrdersController.class_eval do
  before_filter :fix_addresses, :only => [:update]
  after_filter :change_user_email , :only => [:update]
  
  def fix_addresses
    if !@order.line_items.empty?
      if @order.cart? # only fix this on new orders
        if params[:order].key?(:email) and params[:order].key?(:bill_address_attributes) and
          params[:order][:bill_address_attributes][:city] == "" and 
          params[:order][:bill_address_attributes][:firstname] == "" and 
          params[:order][:bill_address_attributes][:lastname] == "" 
          if params[:order][:email] == "" and Spree::Config[:dummy_addresses]
            params[:order][:email] = @order.user.email
            puts "Setting to dummy #{@order.user.email}"
            FindAddressHelper.set_dummy(params[:order][:bill_address_attributes] , @order.user.email)
            FindAddressHelper.set_dummy(params[:order][:ship_address_attributes] , @order.user.email)
          else
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

  def change_user_email
    if @order.user.anonymous? and Spree::Config[:dummy_addresses]
      @order.user.email = params[:order][:email]
      @order.user.save
      #puts "changed anonymous to #{@order.email}"
    end
  end
end
