class Api::V1::PostsController < Api::V1::BaseController

  before_filter :authenticate_user, except: [:index, :show]
  before_filter :authorize_user, except: [:index, :show]

  def index
    post = Post.all
    render json: post.to_json, status: 200
  end

  def show
    post = Post.find(params[:id])
    comment = Comment.find(params[:comment_id])
    render json: post.to_json, status: 200
  end

end
