class Subject < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '英語' },
    { id: 3, name: '国語' },
    { id: 4, name: '数学' },
    { id: 5, name: '理科・物理・化学・生物・地学' },
    { id: 6, name: '社会・地理・日本史・世界史・公民・現代社会・倫理・政治経済・公共' },
    { id: 7, name: '音楽' },
    { id: 8, name: '美術' },
    { id: 9, name: '書道' },
    { id: 10, name: '保健体育' },
    { id: 11, name: '技術・家庭' }
  ]

  include ActiveHash::Associations
  has_many :users
  
  end