module Spree
  module BaseHelper
    def link_to_carrier_tracking(shipment, options = {})
      return unless shipment.tracking && shipment.shipping_method

      options[:target] ||= :blank

      tracking_text = if shipment.carrier.blank?
                        shipment.tracking
                      else
                        shipment.carrier + " " + shipment.tracking
                      end
      if shipment.tracking_url
        link_to(tracking_text, shipment.tracking_link, options)
      else
        content_tag(:span, tracking_text)
      end
    end
  end
end

# Spree::BaseHelper.prepend Spree::BaseHelperDecorator
