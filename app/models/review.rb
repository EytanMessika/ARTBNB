class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :reviewed, class_name: 'User'

  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: false }
  validates :body, presence: true
end
