class Topic < ApplicationRecord
  belongs_to :user
  validates :topic_title, :topic_content, presence: true
end
