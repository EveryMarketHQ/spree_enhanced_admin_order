module SpreeEnhancedAdminOrder
  module Carriers
    extend self

    attr_reader :registered
    @registered = []

    def register(class_name, autoload_require)
      SpreeEnhancedAdminOrder.autoload(class_name, autoload_require)
      self.registered << class_name
    end

    def all
      SpreeEnhancedAdminOrder::Carriers.registered.map { |name| SpreeEnhancedAdminOrder.const_get(name) }
    end

    def find(name)
      if name.downcase.include? 'ups'
        name = 'UPS'
      end
      all.find { |c| c.code.downcase == name.to_s.downcase } or raise NameError, "unknown carrier #{name}"
    end
  end
end

SpreeEnhancedAdminOrder::Carriers.register :USPS, 'shipping/carriers/usps'
SpreeEnhancedAdminOrder::Carriers.register :FedEx, 'shipping/carriers/fedex'
SpreeEnhancedAdminOrder::Carriers.register :UPS, 'shipping/carriers/ups'
SpreeEnhancedAdminOrder::Carriers.register :DHL, 'shipping/carriers/dhl'
SpreeEnhancedAdminOrder::Carriers.register :DHL_Global_Mail, 'shipping/carriers/dhl_global_mail'
