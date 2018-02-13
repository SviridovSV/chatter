class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :filter_with, -> (rate) { where total_rate: rate }

  def self.search(rate)
    unless rate.blank?
      filter_with(rate.to_i)
    else
      order('created_at DESC')
    end
  end
end
