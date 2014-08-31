module SpreeLastAddress
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_last_address'

    config.autoload_paths += %W(#{config.root}/lib)

    class << self
      def activate
        Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
