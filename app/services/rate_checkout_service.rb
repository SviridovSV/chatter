class RateCheckoutService
  def initialize(posts=[])
    @posts = posts
  end

  def remove_unpopular_posts
    @posts.each do |p|
      past_comments = p.comments.where(created_at: p.created_at..(p.created_at + 1800))
      post_rate = average_rating(past_comments)
      if post_rate && post_rate < 3
        p.destroy
      end
    end
    @posts
  end

  def average_rating(comments_array)
    rate_values = comments_array.map{ |comment| comment.rate_value }.compact
    quantity = rate_values.size
    return  nil if rate_values.size < 1
    rate_values.reduce(:+) / quantity
  end
end