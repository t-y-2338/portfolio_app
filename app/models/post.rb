class Post < ApplicationRecord
  belongs_to :user

  has_many :memos, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 300 }
end
