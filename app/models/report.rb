# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  # reportのuserがtarget_userならばtrue
  def editable?(target_user)
    user == target_user
  end

  # reportが作られた日付
  def created_on
    created_at.to_date
  end

end
