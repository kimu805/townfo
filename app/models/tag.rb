class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'イベント' },
    { id: 3, name: 'お知らせ' },
    { id: 4, name: '緊急' },
    { id: 5, name: '重要' }
  ]

  include ActiveHash::Associations
  has_many :notices

end