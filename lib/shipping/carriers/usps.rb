module SpreeEnhancedAdminOrder
  class USPS < Carrier
    attr_reader :name
    @@name = "USPS"

    def self.code
      "USPS"
    end

    def self.tracking_link(tracking_number)
      "https://tools.usps.com/go/TrackConfirmAction?qtc_tLabels1=#{tracking_number}"
    end

  end
end
