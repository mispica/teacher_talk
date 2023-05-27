class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :age
  belongs_to :subject
  belongs_to :prefecture
  belongs_to :operation
  belongs_to :schooltype
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :genre_id, :subject_id, :prefecture_id, :operation_id, :schooltype_id,  numericality: { other_than: 1 , message: "can't be blank"}
end
