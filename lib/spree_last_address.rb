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
  end
end
