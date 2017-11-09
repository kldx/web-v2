require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:profile)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:profile, user: FactoryBot.create(:user))).to be_valid }
  end
end
