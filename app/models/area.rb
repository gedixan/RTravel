class Area < ApplicationRecord

  has_many :area_users, dependent: :destroy
  has_many :users, through: :area_users

  validates :name, presence: true, uniqueness: true, length: { maximum: 200 }
  validates :color, presence: true, exclusion: {in: %w(#FFF #FFFFFF), message: '%{value} no es válido a guardar'}

  scope :actives, -> {where(status: true)}

end