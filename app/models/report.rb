# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :contributor, class_name: 'User'
  has_many :comments, as: :comment, dependent: :destroy
end
