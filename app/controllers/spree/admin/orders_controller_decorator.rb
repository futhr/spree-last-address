module Spree
  Admin::OrdersController.class_eval do
    before_filter :add_last_used_address,      :only => [:update]
    after_filter  :change_user_email_to_dummy, :only => [:update]

    def add_last_used_address
      load_order # used to be done, but not anymore. Save to call twice though
      if !@order.line_items.empty?
        if @order.cart? # only fix this on new orders
          # And only if no bill address was actually entered just now (by the admin)
          if params[:order].key?(:email) and params[:order].key?(:bill_address_attributes) and
              params[:order][:bill_address_attributes][:city] == "" and
              params[:order][:bill_address_attributes][:firstname] == "" and
              params[:order][:bill_address_attributes][:lastname] == ""
            if params[:order][:email] == "" and Spree::Config[:dummy_addresses]
              params[:order][:email] = @order.user.email
              #puts "Setting to dummy #{@order.user.email}"
              SpreeLastAddress.set_dummy(params[:order][:bill_address_attributes] , @order.user.email)
              SpreeLastAddress.set_dummy(params[:order][:ship_address_attributes] , @order.user.email)
            else
              # They entered an email address, so see if we can find their most recent order and fill in the address automatically.
              bill_address, ship_address = SpreeLastAddress.find_last_used_addresses(params[:order][:email])
              return unless bill_address
              #puts "Setting Bill to #{bill_address}"
              SpreeLastAddress.set_params(params[:order][:bill_address_attributes] , bill_address)
              SpreeLastAddress.set_params(params[:order][:ship_address_attributes] , ship_address)
            end
          end
        end
      end
    end

    def change_user_email_to_dummy
      if @order.user.anonymous? and Spree::Config[:dummy_addresses]
        @order.user.email = params[:order][:email]
        @order.user.save
        #puts "changed anonymous to #{@order.email}"
      end
    end
  end
end
