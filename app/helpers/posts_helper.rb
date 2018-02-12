module PostsHelper
  def user_email(comment)
    User.find_by(id: comment.user_id).email
  end
end
