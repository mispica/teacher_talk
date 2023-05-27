class Operation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '公立' },
    { id: 3, name: '国立' },
    { id: 4, name: '私立' }
  ]

  include ActiveHash::Associations
  has_many :users
  
  end