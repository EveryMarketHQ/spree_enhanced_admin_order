module SpreeEnhancedAdminOrder
  class FedEx < Carrier
    attr_reader :name
    @@name = "FedEx"

    def self.code
      "FedEx"
    end

    def self.tracking_link(tracking_number)
      "https://www.fedex.com/fedextrack/?tracknumbers=#{tracking_number}"
    end

  end
end
