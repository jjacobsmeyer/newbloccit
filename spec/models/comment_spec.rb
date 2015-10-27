require 'rails_helper'

RSpec.describe Comment, type: :model do
  let (:post) { Post.create!(title: "New Post Title", body: "New Post Boyd") }
  let (:comment) { Comment.create!(body: "Comment Body") }

  describe "attributes" do
    it "should respond to body" do
      expect(comment).to respond_to(:body)
    end
  end

end
