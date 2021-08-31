class Book < ApplicationRecord
  # Relation
  belongs_to :user

  # Validation
  validates :title, presence: true, length: { maximum: 3 } # 20
  validates :body, presence: true, length: { maximum: 255 }

  # Refile
  attachment :image
end
