class Report < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :users, through: :comments

  def to_hhmmdd(time)
    time.strftime("%T")
  end
end
