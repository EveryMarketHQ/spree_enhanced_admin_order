module Spree
  module ShipmentDecorator
    def self.prepended(base)
      base.include SpreeEnhancedAdminOrder::Spree::CarrierTrackingHelper
      base.before_update :check_and_update_carrier
    end

    def check_and_update_carrier
      if self.carrier.blank? and self.tracking.present?
        self.carrier = get_carrier(self.tracking)
      end
    end


    def tracking_link
      if self.carrier.blank? or self.tracking.blank?
        return self.tracking_url
      end
      SpreeEnhancedAdminOrder::Carriers.find(self.carrier).tracking_link(self.tracking) rescue self.tracking_url
    end
  end
end

::Spree::Shipment.prepend Spree::ShipmentDecorator
