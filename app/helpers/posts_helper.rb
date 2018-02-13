module PostsHelper
  def user_email(comment)
    User.find(comment.user_id).email
  end

  def rate_not_exist?
    user_comments = @post.comments.find_by(user_id: current_user.id)
    return true unless user_comments
    user_comments.rate_value.nil?
  end

  def rate_exist?
    !@post.total_rate.nil?
  end

  def number_of_comments(post)
    post.comments.size
  end
end
