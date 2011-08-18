
class FindAddressHelper
  
  def self.find_address(email)
    past = Order.order("id desc").where(:email => email).where("state != 'cart'").limit(8)
    if order = past.detect(&:bill_address)
      bill_address = order.bill_address.clone if order.bill_address
      ship_address = order.ship_address.clone if order.ship_address
    end
    #puts "Found address= #{bill_address} "
    return bill_address , ship_address
  end
  
  def self.set_params(hash , address )
    [:city, :address1, :address2, :zipcode, :country_id, :lastname, :firstname, :phone, :state_id].each do |attribute|
      hash[attribute] = address.send(attribute)
    end
  end
  
  def self.set_dummy(hash , email )
    dummy = email[0,email.index("@")] 
    [:city, :address1, :address2,  :lastname, :firstname].each do |attribute|
      hash[attribute] = dummy
    end
    hash[:zipcode] = "1000" 
    hash[:phone] = "0202020"
    hash[:country_id] = Spree::Config[:default_country_id]
  end
  
end
