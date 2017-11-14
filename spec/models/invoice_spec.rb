require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validation' do
    it { expect(FactoryBot.build(:invoice, order: nil)).not_to be_valid }
  end
end
