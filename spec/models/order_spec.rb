require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid order factory" do
    expect(FactoryBot.build(:order)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:order, user: FactoryBot.create(:user))).to be_valid }
    it { expect(FactoryBot.build(:order, user: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:order, item: FactoryBot.create(:item))).to be_valid }
    it { expect(FactoryBot.build(:order, item: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:order, quantity: 1)).to be_valid }

    it "will calculate the price based on quantity and item price" do
      order = FactoryBot.build(:order, quantity: 1)
      item = FactoryBot.build(:item, default_price: 120)
      expect(FactoryBot.create(:order, price: order.quantity*item.default_price)).to be_valid
    end
  end
end
