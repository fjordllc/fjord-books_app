class Report < ApplicationRecord
  has_many :comments, as: :commentable

  def to_hhmmdd(time)
    time.strftime("%T")
  end
end
