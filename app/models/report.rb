class Report < ApplicationRecord
  def to_hhmmdd(time)
    time.strftime("%T")
  end
end
