require "spree_last_address/version"

module SpreeLastAddress
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end

  class << self
    def find_last_used_addresses(email)
      past = Spree::Order.order("id desc").where(:email => email).where("state != 'cart'").limit(8)
      if order = past.detect(&:bill_address)
        bill_address = order.bill_address.clone if order.bill_address
        ship_address = order.ship_address.clone if order.ship_address
      end
      #puts "Found address= #{bill_address} "
      return bill_address , ship_address
    end

    def set_params(hash , address )
      [:city, :address1, :address2, :zipcode, :country_id, :lastname, :firstname, :phone, :state_id].each do |attribute|
        hash[attribute] = address.send(attribute)
      end
    end

    def set_dummy(hash , email )
      dummy = email[0,email.index("@")]
      [:city, :address1, :address2,  :lastname, :firstname].each do |attribute|
        hash[attribute] = dummy
      end
      hash[:zipcode] = "1000"
      hash[:phone] = "0202020"
      hash[:country_id] = Spree::Config[:default_country_id]
    end
  end
end
