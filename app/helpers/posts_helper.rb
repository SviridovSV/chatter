module PostsHelper
  def user_email(comment)
    User.find_by(id: comment.user_id).email
  end

  def rating
    rate_values = @post.comments.map{ |comment| comment.rate_value }.compact
    quantity = rate_values.size
    return unless rate_values.size < 1
    rate_values.reduce(:+) / quantity
  end

  def rate_not_exist?
    user_comments = @post.comments.find_by(user_id: current_user.id)
    return false unless user_comments
    user_comments.rate_value.nil?
  end

  def rate_exist?
    @post.comments.map{ |comment| comment.rate_value }.compact.size > 0
  end
end
