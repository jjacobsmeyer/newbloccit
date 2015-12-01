require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }
  let(:my_post) { create(:post) }

  context "unauthenticated user" do

    it "PUT update returns http unauthenticated" do
      put :update, topid_id: my_topic.id, id: my_post.id, post: {title: "Post title", body: "Post Body"}
      expect(response).to have_http_status(401)
    end

    it "POST create returns http unauthenticated" do
      post :create, topic_id: my_topic.id, id: my_post.id, post: {title: "Post title", body: "Post Body"}
      expect(response).to have_http_status(401)
    end

    it "DELETE destroy returns http unauthenticated" do
      delete :destroy, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(401)
    end
  end

  context "unauthorized user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end

    it "PUT update returns http forbidden" do
      put :update, topic_id: my_topic.id, id: my_post.id, post: {title: "Post title", body: "Post Body"}
      expect(response).to have_http_status(403)
    end

    it "POST create returns http forbidden" do
      post :create, topic_id: my_topic.id, id: my_post.id, post: {title: "Post title", body: "Post Body"}
      expect(response).to have_http_status(403)
    end

    it "DELETE destroy returns http forbidden" do
      delete :destroy, topic_id: my_topic.id, id: my_post.id
      expect(response).to have_http_status(403)
    end

  end

end
