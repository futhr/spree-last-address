require 'order'
require 'address'

class FindAddressHelper
  
  def self.find_address(email)
    past = Order.order("created_at").where(:email => email).limit(5)
    past.reverse!.pop
    bill_address , ship_address = nil , nil
    while !bill_address and order = past.pop
      if order.bill_address
        bill_address = order.bill_address.clone
        ship_address = order.ship_address.clone
      end
      #puts "Found address= #{bill_address} "
    end
    return bill_address , ship_address
  end
  
  def self.set_params(hash , address )
    [:city, :address1, :address2, :zipcode, :country_id, :lastname, :firstname, :phone, :state_id].each do |attribute|
      hash[attribute] = address.send(attribute)
    end
  end
  
end
