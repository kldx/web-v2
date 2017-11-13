require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a valid item factory" do
    expect(FactoryBot.build(:item)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:item, user: FactoryBot.create(:user))).to be_valid }
    it { expect(FactoryBot.build(:item, user: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:item, name: "Hello world")).to be_valid }
    it { expect(FactoryBot.build(:item, name: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:item, description: "Hello world content")).to be_valid }
    it { expect(FactoryBot.build(:item, description: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:item, default_picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')))).to be_valid }
    it { expect(FactoryBot.build(:item, default_picture: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:item, name: "Hello world", slug: 'hello-world')).to be_valid }
    it { expect(FactoryBot.build(:item, name: nil, slug: 'games')).not_to be_valid }
    it { expect(FactoryBot.build(:item, quantity: 0)).to be_valid }
    it { expect(FactoryBot.build(:item, quantity: 0, in_stock: false)).to be_valid }
    it { expect(FactoryBot.build(:item, default_price: 200)).to be_valid }
    it { expect(FactoryBot.build(:item, sale_price: nil)).to be_valid }
    it { expect(FactoryBot.build(:item, page_view: 100)).to be_valid }
    it { expect(FactoryBot.build(:item, featured: false)).to be_valid }
    it 'will check when quantity is 0' do
      no_quantity = FactoryBot.build(:item, quantity: 0)
      expect(no_quantity.set_in_stock).to eq(no_quantity.in_stock = false)
    end
    it 'will check when quantity is nil' do
      no_quantity = FactoryBot.build(:item, quantity: nil)
      expect(no_quantity.set_in_stock).to eq(no_quantity.in_stock = false)
    end
    it "will check if no stock" do
      in_stock = FactoryBot.build(:item, in_stock: false)
      expect(in_stock.no_stock).to eq(true)
    end
    it "will check if sale_price is nil" do
      stock_price = FactoryBot.build(:item, sale_price: nil)
      expect(stock_price.exact_price).to eq(stock_price.default_price)
    end
    it "will check if sale_price is not nil" do
      stock_price = FactoryBot.build(:item, sale_price: 100.0)
      expect(stock_price.exact_price).to eq(stock_price.sale_price)
    end
  end
end
