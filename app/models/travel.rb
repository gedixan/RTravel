class Travel < ApplicationRecord

  #relation support
  #belongs_to 
  #has_many
  #has_one
  #has_many :through
  #has_one :through
  #has_and_belongs_to_many
  belongs_to :bus
  belongs_to :travel_route
  belongs_to :person

  #relation uno to uno
  has_one :payment, dependent: :destroy
end