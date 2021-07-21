module SpreeEnhancedAdminOrder
  class DHL < Carrier
    attr_reader :name
    @@name = "DHL"

    def self.code
      "DHL"
    end

    def self.tracking_link(tracking_number)
      "https://www.dhl.com/en/express/tracking.html?brand=DHL&AWB=#{tracking_number}"
    end
  end
end
