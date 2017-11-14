require 'rails_helper'

RSpec.describe Activity, type: :model do
  it "has a valid activity factory" do
    expect(FactoryBot.build(:activity)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:activity, user: FactoryBot.create(:user))).to be_valid }
    it { expect(FactoryBot.build(:activity, user: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:activity, title: "Hello world")).to be_valid }
    it { expect(FactoryBot.build(:activity, title: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:activity, description: "Hello world content")).to be_valid }
    it { expect(FactoryBot.build(:activity, description: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:activity, default_picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')))).to be_valid }
    it { expect(FactoryBot.build(:activity, default_picture: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:activity, start_time: "2014-09-18 12:30:59 -0700")).to be_valid }
    it { expect(FactoryBot.build(:activity, start_time: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:activity, end_time: "2014-09-20 12:30:59 -0700")).to be_valid }
    it { expect(FactoryBot.build(:activity, end_time: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:activity, status: 1)).to be_valid }
    it { expect(FactoryBot.build(:activity, status: nil)).not_to be_valid }
  end
end
