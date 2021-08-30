class Bug < ApplicationRecord
  belongs_to :user
  has_one :status
  validates :user_id, presence: true
end