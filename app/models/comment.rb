class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :rate_value, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }, allow_nil: true
  validates :user_id, uniqueness: true, if: :current_user_rate?

  private

  def current_user_rate?
    !self.rate_value.nil?
  end
end
