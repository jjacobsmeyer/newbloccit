class SponsoredPostsController < ApplicationController

  def show
    @sponsored_post = Sponsored_post.find(params[:id])
  end

  def new
  end

  def edit
  end

end
