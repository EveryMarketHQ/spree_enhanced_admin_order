module SpreeEnhancedAdminOrder
  class UPS < Carrier
    attr_reader :name
    @@name = "UPS"

    def self.code
      "UPS"
    end

    def self.tracking_link(tracking_number)
      "https://www.ups.com/track?loc=null&tracknum=#{tracking_number}"
    end
  end
end
