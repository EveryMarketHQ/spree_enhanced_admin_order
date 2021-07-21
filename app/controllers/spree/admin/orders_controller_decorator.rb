module Spree
  module Admin
    module OrdersControllerDecorator

      def edit
        redirect_to admin_order_url(@order)
      end

      def show
        load_order
        @order.refresh_shipment_rates(ShippingMethod::DISPLAY_ON_BACK_END) unless @order.completed?
      end

      def resend
        OrderMailer.confirm_email(@order.id, true).deliver_later
        flash[:success] = Spree.t(:order_email_resent)

        redirect_back fallback_location: spree.admin_order_url(@order)
      end

      def resend_shipped
        load_order
        @order.shipments.each do |shipment|
          ShipmentMailer.shipped_email(shipment.id).deliver_later
        end

        flash[:success] = Spree.t(:order_shipment_email_resent)
        redirect_back fallback_location: spree.admin_order_url(@order)
      end
    end
  end
end


::Spree::Admin::OrdersController.prepend Spree::Admin::OrdersControllerDecorator
