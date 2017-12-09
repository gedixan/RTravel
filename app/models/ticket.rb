class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :person
  belongs_to :travel

  def generate_code
    self.code = self.travel.code + "-" + (self.travel.tickets.count + 1).to_s.rjust(4,"0")
  end

end