module SpreeEnhancedAdminOrder
  class Carrier
    def self.tracking_link(tracking_number)
      raise NotImplementedError, "#tracking_link is not supported by #{self.class.name}."
    end
  end
end
