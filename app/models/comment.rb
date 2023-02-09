# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :comment, polymorphic: true
  belongs_to :user
  validates :text, presence: true
end
