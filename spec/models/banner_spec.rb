require 'rails_helper'

RSpec.describe Banner, type: :model do
  it "has a valid banner factory" do
    expect(FactoryBot.build(:banner)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:banner, user: FactoryBot.create(:user))).to be_valid }
    it { expect(FactoryBot.build(:banner, user: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:banner, title: "Hello world")).to be_valid }
    it { expect(FactoryBot.build(:banner, title: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:banner, default_picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')))).to be_valid }
    it { expect(FactoryBot.build(:banner, default_picture: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:banner, title: "Hello world", slug: 'hello-world')).to be_valid }
    it { expect(FactoryBot.build(:banner, title: nil, slug: 'games')).not_to be_valid }
  end
end
