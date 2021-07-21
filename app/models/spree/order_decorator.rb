module Spree
  module OrderDecorator
    def payment_state_readable
      return 'refunded' if self.refunds.any?
      payment_state
    end

    def can_approve?
      completed? && !approved?
    end
  end
end

::Spree::Order.prepend Spree::OrderDecorator
