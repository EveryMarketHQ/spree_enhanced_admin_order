module Spree::Admin::PaymentsControllerDecorator

  def index
    redirect_to admin_order_url(@order)
  end
end

::Spree::Admin::PaymentsController.prepend Spree::Admin::PaymentsControllerDecorator
