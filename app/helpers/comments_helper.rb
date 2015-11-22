module CommentsHelper

  def user_is_authorized_for_comment?(comment)
    current_user && (current_user == comment.user || current_user.admin?)
  end

  def comments_exists?
    if current_user.comments.count == 0 then "#{@user.name} has not submitted any comments yet."
    end
  end


end
