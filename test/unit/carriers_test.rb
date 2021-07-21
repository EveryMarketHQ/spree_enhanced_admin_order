require 'spree_core'
require 'spree_extension'
require 'spree_admin_onepage_order'

class CarriersTest < ActiveSupport::TestCase
  test ".find searches by string for a carrier and finds USPS" do
    assert_equal SpreeEnhancedAdminOrder::USPS, SpreeEnhancedAdminOrder::Carriers.find('usps')
    assert_equal SpreeEnhancedAdminOrder::USPS, SpreeEnhancedAdminOrder::Carriers.find('USPS')
  end

  test ".find searches by symbol for a carrier and finds USPS" do
    assert_equal SpreeEnhancedAdminOrder::USPS, SpreeEnhancedAdminOrder::Carriers.find(:usps)
  end

  test ".find raises with an unknown carrier" do
    assert_raises(NameError) { SpreeEnhancedAdminOrder::Carriers.find(:polar_north) }
  end
end
