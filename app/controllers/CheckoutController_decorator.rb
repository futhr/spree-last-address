require 'checkout_controller'

CheckoutController.class_eval do

  private


  def before_address
    puts "BEFORE ADDRESS2 called user= #{@order}  #{@order.email}"
    if @order.email 
      past = Order.order("created_at").where(:email => @order.email).limit(5)
      past.reverse!.pop
      while !@order.bill_address and order = past.pop
        if order.bill_address
          @order.bill_address = order.bill_address.clone
          @order.ship_address = order.ship_address.clone
        end
        puts "Found address= #{@order.bill_address} "
      end
    end
    @order.bill_address ||= Address.new(:country => default_country)
    @order.ship_address ||= Address.new(:country => default_country)
  end


end
