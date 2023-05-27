class Schooltype < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '中学校' },
    { id: 3, name: '高等学校' },
    { id: 4, name: '中高一貫校' }
  ]

  include ActiveHash::Associations
  has_many :users
  
  end