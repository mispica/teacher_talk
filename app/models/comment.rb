class Comment < ApplicationRecord
  validates :comment_content, presence: true


  belongs_to :topic
  belongs_to :user
end
