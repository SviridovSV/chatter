class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :rate_value, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }, allow_nil: true
  validate :current_user_rate, if: :rate_value?

  def current_user_rate
    comment = Comment.find_by(user_id: self.user_id, post_id: self.post_id)
    if comment && !comment.first.rate_value.nil?
      errors.add(:rate_value, 'alredy exist for this post')
      return false
    else
      return true
    end
  end

  private

  def rate_value?
    !self.rate_value.nil?
  end
end
