module PostsHelper
  def user_email(comment)
    User.find(comment.user_id).email
  end

  def rate_not_exist?
    user_comments = @post.comments.find_by(user_id: current_user.id)
    return false unless user_comments
    user_comments.rate_value.nil?
  end

  def rate_exist?
    !@rate.nil?
  end
end
