class Profile < ApplicationRecord
  belongs_to :user

  def full_address?
    no_address? ? "Please update your shipping address" : shipping_address
  end

  def shipping_address
    "#{address}, #{postcode} #{city}, #{state}, #{country}"
  end

  def no_address
    address.nil? || postcode.nil? || city.nil? || state.nil? || country.nil?
  end
end
