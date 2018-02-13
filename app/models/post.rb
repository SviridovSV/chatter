class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :filter_with, -> (rate) { where total_rate: rate }

  def self.search(rate)
    unless rate.blank?
      filter_with(rate.to_i)
    else
      all
    end
  end
end
