class Report < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :users, through: :comments, source: :commentable, source_type: 'User'
end
