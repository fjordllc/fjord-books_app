# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def name_or_email
    if user.name.empty?
      user.email
    else
      user.name
    end
  end
end
