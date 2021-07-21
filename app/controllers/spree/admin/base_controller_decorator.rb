module Spree
  module Admin
    module BaseControllerDecorator
      def self.prepended(base)
        base.helper Spree::CarrierTrackingHelper
      end
    end
  end
end


::Spree::Admin::BaseController.prepend Spree::Admin::BaseControllerDecorator
