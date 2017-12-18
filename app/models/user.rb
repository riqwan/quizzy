class User < ApplicationRecord
  has_one :quiz_response

  validates :uid, :name, presence: true
  validates :uid, uniqueness: true
end
