class Topic < ApplicationRecord
  belongs_to :user
  validates :topic_title, :topic_content, presence: true
  has_many :comments, dependent: :destroy
end
