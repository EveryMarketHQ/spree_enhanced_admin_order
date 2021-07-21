module SpreeEnhancedAdminOrder
  class DHL_Global_Mail < Carrier
    attr_reader :name
    @@name = "DHL Global Mail"

    def self.code
      "DHL Global Mail"
    end

    def self.tracking_link(tracking_number)
      "https://parcelsapp.com/en/tracking/#{tracking_number}"
    end
  end
end
