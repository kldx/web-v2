require 'rails_helper'

RSpec.describe Article, type: :model do
  it "has a valid article factory" do
    expect(FactoryBot.build(:article)).to be_valid
  end

  describe 'validation' do
    it { expect(FactoryBot.build(:article, user: FactoryBot.create(:user))).to be_valid }
    it { expect(FactoryBot.build(:article, user: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:article, category: FactoryBot.create(:category))).to be_valid }
    it { expect(FactoryBot.build(:article, category: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:article, title: "Hello world")).to be_valid }
    it { expect(FactoryBot.build(:article, title: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:article, content: "Hello world content")).to be_valid }
    it { expect(FactoryBot.build(:article, content: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:article, default_picture: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'media', 'default.png')))).to be_valid }
    it { expect(FactoryBot.build(:article, default_picture: nil)).not_to be_valid }
    it { expect(FactoryBot.build(:article, title: "Hello world", slug: 'hello-world')).to be_valid }
    it { expect(FactoryBot.build(:article, title: nil, slug: 'games')).not_to be_valid }
    it { expect(FactoryBot.build(:article, status: :pending)).to be_valid }
    it { expect(FactoryBot.build(:article, featured: false)).to be_valid }
  end
end
