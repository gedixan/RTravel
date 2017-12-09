class Bus < ApplicationRecord

  has_many :seatings, dependent: :destroy

  scope :actives, -> { where(status: true) }
  scope :have_locked, -> { self.actives.where(locked: true) }

  def time_departure
    _time = Time.now
    "#{self.name[0,2]}" + "-"  + _time.strftime("%H:%M")
  end
end
