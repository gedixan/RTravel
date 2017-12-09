class Seating < ApplicationRecord
  belongs_to :bus

  delegate :description, to: :bus, prefix: true, allow_nil: true
  delegate :name, to: :bus, prefix: true, allow_nil: true
  delegate :time_departure, to: :bus, prefix: true, allow_nil: true
end
