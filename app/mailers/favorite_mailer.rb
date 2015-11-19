class FavoriteMailer < ApplicationMailer
  default from: "jacobsmeyertech@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@cryptic-atoll-1913.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@cryptic-atoll-1913.com>"
    headers["References"] = "<post/#{post.id}@cryptic-atoll-1913.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
end
