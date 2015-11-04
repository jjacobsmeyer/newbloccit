require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:sponsored_post) { topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 6) }

  it { should belong_to(:topic) }

  describe "attributes" do
  # #2
    it "should respond to title" do
      expect(sponsored_posts).to respond_to(:title)
    end

  # #3
    it "should respond to body" do
      expect(sponsored_posts).to respond_to(:body)
    end

    it "should respond to price" do
      expect(sponsored_posts).to respond_to(:price)
    end

  end
end
