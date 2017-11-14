require 'rails_helper'

RSpec.describe Visit, type: :model do
  it "has a valid visit factory" do
    expect(FactoryBot.build(:visit)).to be_valid
  end

  describe 'validation' do
  end
end
