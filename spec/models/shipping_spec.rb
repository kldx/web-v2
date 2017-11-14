require 'rails_helper'

RSpec.describe Shipping, type: :model do
  it "has a valid shipping factory" do
    expect(FactoryBot.build(:shipping)).to be_valid
  end

  describe 'validation' do
  end
end
