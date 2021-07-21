module Spree
  module ShipmentDecorator
    def tracking_link
      if self.carrier.blank? or self.tracking.blank?
        return self.tracking_url
      end
      SpreeEnhancedAdminOrder::Carriers.find(self.carrier).tracking_link(self.tracking) rescue self.tracking_url
    end
  end
end

::Spree::Shipment.prepend Spree::ShipmentDecorator
