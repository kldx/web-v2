require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid user factory" do
    expect(FactoryBot.build(:category)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:category, name: "Sports")).to be_valid }
    it { expect(FactoryBot.build(:category, name: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:category, name: "Sports", slug: 'sports')).to be_valid }
    it { expect(FactoryBot.build(:category, name: nil, slug: 'games')).not_to be_valid }
  end
end
