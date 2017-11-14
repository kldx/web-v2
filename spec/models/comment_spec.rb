require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid comment factory" do
    expect(FactoryBot.build(:comment)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:comment, user: FactoryBot.create(:user))).to be_valid }
    it { expect(FactoryBot.build(:comment, user: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:comment, body: "Hello world")).to be_valid }
    it { expect(FactoryBot.build(:comment, body: nil)).not_to be_valid }
  end
end
