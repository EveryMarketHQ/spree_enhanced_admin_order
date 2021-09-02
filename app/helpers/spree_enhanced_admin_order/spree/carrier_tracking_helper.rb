module SpreeEnhancedAdminOrder
  module Spree
    module CarrierTrackingHelper
      def link_to_carrier_tracking(shipment, options = {})
        return unless shipment.tracking && shipment.shipping_method

        options[:target] ||= :blank

        tracking_text = if shipment.carrier.nil? || shipment.carrier.blank?
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


      def get_carrier(tracking_number)
        tracking_number_str = tracking_number.downcase
        if tracking_number_str.start_with?("gm")
          return "DHLGlobalMail"
        end
        if tracking_number.first == "9" and tracking_number.length > 15
          return "USPS"
        end
        if is_number?(tracking_number) and tracking_number.length == 10
          return "DHL"
        end
        if is_number?(tracking_number) and tracking_number.length == 12
          return "FedEx"
        end
        if tracking_number_str.start_with?('1z') and tracking_number_str.length == 18
          return 'UPS'
        end

        "USPS"
      end

      def is_number? string
        true if Float(string) rescue false
      end
    end
  end
end
