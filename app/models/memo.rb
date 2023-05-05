class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: { maximum: 500 }
end