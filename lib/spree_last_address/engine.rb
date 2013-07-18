module SpreeLastAddress
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_last_address'

    config.autoload_paths += %W(#{config.root}/lib)

    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end

  class << self
    def find_last_used_addresses(email)
      past = Spree::Order.order("id desc").where(email: email).where("state != 'cart'").limit(8)
      if order = past.detect(&:bill_address)
        bill_address = order.bill_address.clone if order.bill_address
        ship_address = order.ship_address.clone if order.ship_address
      end
      # puts "Found address= #{bill_address} "
      return bill_address, ship_address
    end
  end
end
