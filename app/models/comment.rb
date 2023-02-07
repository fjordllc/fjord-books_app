# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :comment, polymorphic: true
  belogns_to :user
end
