class Book < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

end


