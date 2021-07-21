module Spree
  module Api
    module V1
      module ShipmentsControllerDecorator
        def update
          @shipment = ::Spree::Shipment.accessible_by(current_ability, :update).readonly(false).find_by!(number: params[:id])

          @shipment.update_attributes_and_order(shipment_params)

          respond_with(@shipment.reload, default_template: :show)
        end

      end
    end
  end
end

::Spree::Api::V1::ShipmentsController.prepend Spree::Api::V1::ShipmentsControllerDecorator
